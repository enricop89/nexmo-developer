---
title: Overview
Description: A Nexmo application contains the security and configuration information you need to connect to Nexmo endpoints and use the Nexmo APIs.
navigation_weight: 1
---

# Overview

A Nexmo application contains the security and configuration information you need to connect to Nexmo endpoints and use the Nexmo APIs.

Each Nexmo application created can support multiple capabilities - for example you can create an Application that supports using the Voice, Messages and RTC APIs.

![Application Overview](/assets/images/nexmo_application_v2.png "Application Overview")

## Structure

Each application has the following:

Name | Description
-- | --
`ID` | Used to identify each application and used in conjunction with `private_key` to generate JWTs.
`name` | The application name.
`capabilities` | Describes the types of functionality this application will support. The capabilities `voice`, `messages`, `rtc`. Any number of these capabilities can be supported in one application.
`private_key` | You use the private key to generate the JWTs used to authenticate your calls to the Nexmo APIs.
`public_key` | Used by Nexmo to authenticate the JWT in your requests to Nexmo API.
`webhooks` | Nexmo sends and retrieves information via your webhook endpoints.

## Application capabilities

A Nexmo application can be multifunctional, in that one Nexmo application can use various APIs, including Voice, Messages and Dispatch, Conversation, and Client SDK.

When creating an application you can specify the capabilities you want your application to support. For each capability you can set webhooks depending on what capabilities you want, for example for an application with an `rtc` capability you could specify an event URL to receive RTC events. If your application also wanted to exploit `voice` capabilities you could also potentially set an Answer URL to receive a call answered webhook, and another event URL to receive voice call related events.

A summary of capabilities is given in the following table:

Capability | Description
---|---
`voice` | Used to support Voice capabilities.
`messages` | Used to support Messages and Dispatch API capabilities.
`rtc` | Used to support WebRTC capabilities. Typically for use with Client SDK.
`vbc` | Used to determine pricing, but currently has no other capabilities.

## Webhooks

The webhook URLs you provide when creating an application depend on the application capabilities required. The following table summarizes the webhooks:

Capability | API used | Webooks available
--- | --- | ---
`voice` | Voice | answer, event
`messages` | Messages and Dispatch | inbound, status
`rtc` | Client SDK | event
`vbc` | VBC | None

## Webhook types

The following table describes webhooks available per capability:

Capability | Webhook | Example | Description
--- | --- | --- | ---
`voice` | Answer | https://example.com/webhooks/answer | The URL that Nexmo make a request to when a call is placed/received. Must return an NCCO.
`voice` | Event | https://example.com/webhooks/event | Nexmo will send call events (e.g. ringing, answered) to this URL.
`messages` | Inbound | https://example.com/webhooks/inbound | Nexmo will forward inbound messages to this URL.
`messages` | Status | https://example.com/webhooks/status | Nexmo will send message status updates (for example, `delivered`, `seen`) to this URL.
`rtc` | Event | https://example.com/webhooks/rtcevent | Nexmo will send RTC events to this URL.
`vbc` | None | None | Not used

## Creating applications

There are four main ways to create an application:

1. In the Nexmo Dashboard (this is currently restricted to v1 Applications with a single fixed capability).
2. Using the Nexmo CLI.
3. Using the [Applications API](https://developer.nexmo.com/api/application.v2).
4. Using one of the Nexmo client libraries.

## Getting started with applications

Using CLI (awaiting CLI support).
