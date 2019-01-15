# Cisco Prime
[Cisco Prime](https://www.cisco.com/c/en/us/products/cloud-systems-management/prime-infrastructure/index.html) is a leading network management tool to enable enterprise network management. This integration polls for new Alarms entries and will notify the appropriate group. The integration allows for responses to be carried back to Prime to update the Alarm with Acknowledgement and Annotations. 

<kbd>
  <img src="https://github.com/xmatters/xMatters-Labs/raw/master/media/disclaimer.png">
</kbd>

# Pre-Requisites
* Cisco Prime version 3.4
* xMatters account - If you don't have one, [get one](https://www.xmatters.com)!

# Files


# How it works
Cisco Prime does not have a way to push Alarms out, so the xMatters Agent polls Prime very so often (defined in the cronjob or system scheduler) to poll for new Alarms with severity `CRITICAL` or `MAJOR` (for more information on filtering the Alarms, check [here](https://d1nmyq4gcgsfi5.cloudfront.net/media/pi_3_4_devnet/api/v4/index.html@id=filtering-doc.html)) in the last X minutes. `X` is defined in the `Poller Interval` constant and will need to match the cronjob set up below. For each Alarm found, a new event is generated and any subscribed recipients are notified. 

The **Acknowledge** response will acknowledge the Alarm and any comments will be sent back to the Alarm as annotations. 

# Installation


## Cisco Prime set up

First, we need a user for the xMatters agent to authenticate to Prime with. Navigate to the Administration > Users section.

<kbd>
	<img src="/media/prime_admin_users.jpg" />
</kbd>

Be sure to grant the `NBI Read` and `NBI Write` permissions to allow the agent to red the Alerts as well as acknowledge and annotate them. 

<kbd>
	<img src="/media/prime_admin_user_details.jpg" />
</kbd>



## xMatters set up

First, get the xAgent installed. Check out the help page [here](https://help.xmatters.com/ondemand/xmodwelcome/xmattersagent/xmatters-agent-topic.htm). 

Then:
1. Upload the [CiscoPrimeCommPlan.zip](CiscoPrimeCommPlan.zip) comm plan to the Comm Plans section of the Developer tab. 
2. Click Edit > Integration Builder and click Endpoints. In the **Cisco Prime** endpoint, enter the URL relative to the xAgent as well as the username and password for the xMatters user created in Prime. 
3. On the Integration Builder tab, expand the Inbound Integrations and click the link for the **New Alarm** integration. Scroll to the bottom and select the appropriate user the agent should use to authenticate into xMatters with. For example, if you created a user called `Cisco Prime`, then select that user as the Authenticating user. When you change the Authenticating user, a new url is generated, so click Copy. 
4. Click the **Edit Constants** button and click on the inbound **Inbound Alarm Endpoint**. Paste in the path portion, the part after the `.com` of the url for the **New Alarm** integration. Be sure to include the `apiKey`. Click Save Changes. 
5. On the Integration Builder tab, expand the Inbound Integrations and click the link for the **Inbound Poller** integration. Scroll to the bottom and again, select the appropriate user, this user should match the user selected in the other integration. Click the **copy** link to copy the url. This url will be the IP address(es) of the agent and will be used to trigger the agent to poll Prime for updates. 


**Poller**
1. Edit the [triggerPoller.sh](triggerPoller.sh) file and update the `XAGENT_URL` value to the url we just copied. Save the file to the server the agent is running on. 
2. Add a new cronjob to fire the `triggerPoller.sh` file every 5 minutes. For example:

```
*/5 * * * * /usr/local/bin/triggerPoller.sh
```

3. Restart the agent. 

# Testing
Every 5 minutes the cronjob will wake up the agent. For any Alarms returned byt the query, a new event will be created. 

# Troubleshooting
## Outbound from Prime
The first place to check is the xMatters Agent logs. Make sure the agent is successfully connected and if so, any attempts to trigger the integration, such as from the polling script, will be logged in the appropriate place per operating system. [This](https://help.xmatters.com/ondemand/xmodwelcome/xmattersagent/monitor-xmatters-agent.htm) page has more details on troubleshooting the agent. 

If the agent is successfully triggered, then you can check the Activity Stream for the **Inbound Poller** and the **New Alarm** integrations for any errors. 

## Inbound to Prime
Check the Activity Stream in the **Alarm Comments** and **Alarm Response** integrations for any errors the agent reports when attempting to update Prime. 

