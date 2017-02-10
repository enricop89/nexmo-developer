---
title: 2FA
---

# Two-factor Authentication API

You use Two-factor Authentication API to prove a user's identity. Provision a US Short Code with a standard or custom template that specifies the custom parameters for two-factor authentication (2FA) messages. These APIs support 2FA for the US and Canada.

Two-factor authentication (also known as 2FA) provides user identification by combining two different components. In this case, a phone number associated with your user and a PIN. Before you use this API you have to [Setup a Pre-approved Short Code for 2FA](tools/dashboard#shortcode).

The workflow for Two-factor Authentication API is:

![Two-factor Authentication workflow](/assets/images/workflow_2fa.svg)

1. Send a 2FA [request](messaging/us-short-codes-api/two-factor-authentication/api-reference#request).
2. Check the [response codes](messaging/us-short-codes-api/two-factor-authentication/api-reference/#response-code) in the [response](messaging/us-short-codes-api/two-factor-authentication/api-reference#response) and ensure that you sent the request to Nexmo correctly.
3. Nexmo delivers your PIN to your user's handset. Your user enters this PIN into your APP.
4. Receive the [delivery receipt](messaging/us-short-codes-api/two-factor-authentication/api-reference#delivery-receipt) at your [webhook endpoint](messaging/setup-callbacks) and verify delivery.

To ensure that your traffic is send over the best possible route, use [Conversion API](messaging/conversion-api) to tell us about the reliability of your 2FA communication. Adding your conversion data means Nexmo delivers your messages faster and more reliably.

> Note: quality of delivery (QoD) statistics are based on delivery receipts (DLR). For the US we only receive intermediate and not handset DLRs. This means Dashboard analytics cannot show QoD statistics for short codes.

## Implementing the Two-factor Authentication API workflow

To use the 2FA API you:

1. Send a 2FA [request](messaging/us-short-codes-api/two-factor-authentication/api-reference#request).

    ```tabbed_examples
    source: '_examples/messaging/2fa/send-a-2fa-request'
    ```

2. Check the [response codes](messaging/us-short-codes-api/two-factor-authentication/api-reference/#response-code) in the [response](messaging/us-short-codes-api/two-factor-authentication/api-reference#response) and ensure that you sent the request to Nexmo correctly.

    ```tabbed_examples
    source: '_examples/messaging/2fa/check-the-response-codes'
    ```

3. Nexmo delivers your PIN to your user's handset. Your user enters this PIN into your APP.

4. Receive the [delivery receipt](messaging/us-short-codes-api/two-factor-authentication/api-reference#delivery-receipt) at your [webhook endpoint](messaging/setup-callbacks) so you can see:

    1. If the [status](messaging/us-short-codes-api/two-factor-authentication/api-reference#status) was successful.
    2. When and how the call was made.
    3. How much the call cost.

    ```tabbed_examples
    source: '_examples/messaging/2fa/delivery-receipt'
    ```

> Note: remember to return a `200` status code when you receive the delivery receipt.