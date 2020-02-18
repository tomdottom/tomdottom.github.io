---
tags:
  - article
  - draft
layout: base
title: A Message Queue is not a Task Queue
permalink: "articles/a-message-queue-is-not-a-task-queue/"
summaryLength: 5
date: 2020-02-17
---
## What is a Task Queue

A _Task Queue_ is almost self explanitory.  At it's simplest it is a list of tasks that need to be processed in some sort of order.

The queue itself does not do any of the work and relies on the external workers to process the tasks.

<div class="columns">
  <div class="column is-half">
    At a minimum each task should be in one of the following states:
    <ul>
      <li>Waiting to be processed</li>
      <li>In Progress</li>
      <li>Completed</li>
      <li>Err/Failed</li>
    </ul>
  </div>
  <div class="column has-text-centered">
    <img src="/static/images/simple-fifo-task-queue.svg" alt="simple-fifo-task-queue" />
  </div>
</div>


## Properties of a Message Queue

TODO ...

