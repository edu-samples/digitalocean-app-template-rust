# Rust HTTP Sample for DigitalOcean App Platform

## Get Started

This guide describes how to use DigitalOcean App Platform to run a sample Rust HTTP application using Actix-web.

**Note**: Following these steps may result in charges for the use of DigitalOcean services.

### Requirements

* You need a DigitalOcean account. If you do not already have one, first [sign up](https://cloud.digitalocean.com/registrations/new) to create a free account.

## Deploy the App

Click the following button to deploy the app to the App Platform. If you are not logged in, this button prompts you to log in.

[![Deploy to DigitalOcean](https://www.deploytodo.com/do-btn-blue.svg)](https://cloud.digitalocean.com/apps/new?repo=https://github.com/edu-samples/digitalocean-app-template-rust/tree/master)

This button deploys the app directly from this repository, which is a template for a Rust Actix-web application.

After clicking **Deploy to DigitalOcean** or following the manual flow, follow these steps:

1. Fork this repository if you want to make changes to the code.
2. Visit the [Apps control panel](https://cloud.digitalocean.com/apps) and click **Create App**.
3. Under **Service Provider**, select **GitHub**, then choose your forked repo and branch **main**.
4. Ensure **Autodeploy** is checked, and click **Next**.
5. On the **Components** page, you should see one service named **web** with the Dockerfile detected. Leave defaults and click **Next**.
6. Click **Create App** to launch your service.

It can take a few minutes for the build to finish. You can monitor progress in the **Deployments** tab. Once it completes, click **Live App** to see your running application, which should display **Hello from Actix-web!**

## Make Changes to Your App

If you forked this repo, any change pushed to the **main** branch automatically redeploys with zero downtime.

Example change:
1. Edit `src/main.rs` and replace the greeting in the `index` handler.
2. Commit and push to **main**.
3. Observe the new deployment and click **Live App** to verify.

## Learn More

Learn more about Actix-web: https://actix.rs/
Learn more about App Platform: https://www.digitalocean.com/docs/app-platform/

## Clean Up

To delete the app and avoid charges:
1. Go to the [Apps control panel](https://cloud.digitalocean.com/apps).
2. Select your app.
3. In **Settings**, click **Destroy**.

**Note**: Charges accrue while the app is running.
