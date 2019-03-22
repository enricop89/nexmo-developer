---
title: Applications
Description: A Nexmo application contains the security and configuration information you need to connect to Nexmo endpoints and easily use our products.
navigation_weight: 1
---

# Application Overview

A Nexmo application contains the security and configuration information you need to connect to Nexmo endpoints and easily use our products. You use one or more applications to supply a service based on a Nexmo Product. For example, you may create one Voice application to record calls to your support center, and another application for internal conferences.

![Application API Workflow](/assets/images/capi_architecture.svg)

## Structure

Each application has the following:

Name | Description
-- | --
`msisdn` | A virtual phone number that you rent from Nexmo and is associated with this application.
`capabilities` | Describes the Nexmo API you access for your application. Possible values: `voice`, `messages`, `rtc`.
`private_key` | You use the private key to generate the JWTs used to authenticate your calls to the Nexmo APIs.
`public_key` | Used by Nexmo to authenticate the JWT in your requests to Nexmo API.
`applicationID` | Used to identify each application & used in conjunction with *private_key* to generate JWTs.
`webhooks` | Nexmo sends and retrieves information via your webhook endpoints

> **Note**: by default, all HTTP requests are POST.

You use Application API to [create, list, modify and delete applications](/api/application.v2).

## Application capabilities

A Nexmo can be multifunctional, in that one Nexmo application can use various APIs, including VAPI, Messages and Dispatch and RTC/Client SDK applications. When creating an application you can specify the capabilities youn want your application to support. This means you can set webhooks depending on what capabilities you want, for example for an application with an `rtc` capability you could specify an event URL to receive RTC events. If your application also wanted to exploit `voice` capabilities you could also potentially set an Answer URL to receive a call answered webhook, and another event URL to receive voice call related events.

## Webhooks

The webhook URLs you provide when creating an application depend on the application capabilities required. The following table summarizes the webhooks:

API used | Capability | Webooks available
--- | --- | ---
Voice | `voice` | answer, event
Messages and Dispatch | `messages` | inbound, status
Client SDK | `rtc` | event

## Webhook types

Table describing webhooks per capability:

Capability | Webhook | Example | Description
--- | --- | --- | ---
`voice` | Answer | https://example.com/webhooks/answer | The URL that Nexmo make a request to when a call is placed/received. Must return an NCCO.
`voice` | Event | https://example.com/webhooks/event | Nexmo will send call events (e.g. ringing, answered) to this URL.
`messages` | Inbound | https://example.com/webhooks/inbound |Nexmo will forward inbound messages to this URL.
`messages` | Status | https://example.com/webhooks/status | Nexmo will send message status updates (for example, `delivered`, `seen`) to this URL.
`rtc` | Event | https://example.com/webhooks/rtcevent | Nexmo will send RTC events to this URL.

## Getting started with applications

```tabbed_content
source: _examples/concepts/guides/applications/
```
