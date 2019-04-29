# InMobile Module

**Please do read the [Disclaimer.md](/Disclaimer.md) before any use of anything on this repository.**

This is an unofficial client for [inMobile](https://inmobile.dk) API. It's build as a Powershell Module, that can interact with the InMobile API.

Version: 0.0.0.1
This is written so it supports [Microsoft Powershell Core](https://github.com/PowerShell/PowerShell).

## ToDo

* Design
  * Next in line
  * Roadmap

* Issues
  * Issue

* Functions
  * Get-Group - Issue: #1
  * Get-GroupMembers - Issue #2
    * Get all groups
    * Get specific group
  * New-group - Issue: #3
    * Create group

## Todo [Done]

* Design
  * Next in line
  * Roadmap

* Issues
  * Issue -1

* Functions
  * Function 0

## InMobile list

Of the 16-04-2019, this was the list from InMobiles list of functions and API calls.

If there is a [-] after the line, it's need created at an Issue and is being planed for.

Belove are only a template for what will be added in the first version release.

### Overview

* Introduction
  * Sendingmessages (POST)
  * The request
  * The reply
  * Error codes
* Sending messages (GET)
  * The request
  * The reply
  * Error codes
* Message statuses (PUSH)
* Message statuses (PULL) 
  * The request
  * The reply
  * Status codes
  * Error codes
* Cancel messages
  * The request
  * The reply
  * Error codes
* Incoming messages
* Statistics summary
  * The request
  * The reply
  * Error codes
* Groups and Recipients
  * Example
  * Functionality list
    * Get all groups [-]
    * Get specific group [-]
    * Create group [-]
    * Delete group
    * Get all recipients in group  [-]
    * Get single recipient in group [-]
    * Create or update recipient
    * Delete single recipient
    * Delete all recipients in group
    * Add number to blacklist
    * Remove from blacklist
    * Get number info in blacklist
    * Get all entries in blacklist
