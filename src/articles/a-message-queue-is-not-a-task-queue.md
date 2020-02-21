---
tags:
  - article
  - draft
layout: base
title: A Message Queue is not a Task Queue
permalink: "articles/a-message-queue-is-not-a-task-queue/"
summaryLength: 4
date: 2020-02-17
---
## What is a Task Queue
-----------------------

<section class="tile"><div class="tile is-8"><div>

A Task Queue is almost self explanatory.  At it's simplest it is a list of tasks that need to be processed in some sort of order.

The queue itself does not do any of the work and relies on the external workers to process the tasks.

At a minimum each task should be in one of the following states:

* Waiting to be Processed
* In Progress
* Completed
* Err/Failed

</div></div><div class="tile">
  <figure class="image is-3by4 is-fullwidth has-text-centered">
    <img src="/static/images/simple-fifo-task-queue.svg" alt="simple-fifo-task-queue" />
  </figure>
</div></section>



## Using a Simple Message Queue
-------------------------------

<section class="tile"><div class="tile is-8"><div>


Message Queues are often used as the underlying technology upon which _Task Queues_ are implemented.

It's easy to see why this is so common as on it's surface a _task queue_ is seemingly similar to a _message queue_.  The tempation would be to store serialised task data in the message body and map the message state to task state.

* Waiting to be Processed -> Message Queued
* In Progress -> Delivered
* Competed -> Acknowledged
* Err/Failed - > Negative Acknowlegedment

</div></div><div class="tile">
  <figure class="image is-3by4 is-fullwidth has-text-centered">
    <img src="/static/images/simple-fifo-message-queue.svg" alt="simple-fifo-message-queue" />
  </figure>
</div></section>


## Where the similarities start to break down
---------------------------------------------

<section class="tile"><div class="tile is-8"><div>

Message queues are typically designed to be fast first in first out (FIFO) systems.  Importantly messages cannot be modified and the queues do not support insertion.

To resend any failed message (or task) the message has to be copied and reinserted onto the end of the queue and wait for preceding tasks to be cleared.

However, it's not uncommon to want a task queue to try and process
its earliest queued tasks first.
Basically First Queued First Processed (FQFP).
Tasks can be updated (at least some of its metadata can) and it may even by possible to insert new tasks ahead of others.

<div class=" has-text-centered">
<br/>

**Message Queue FIFO != FQFP Task Queue**

</div>

</div></div><div class="tile">
  <figure class="image is-3by4 is-fullwidth has-text-centered">
    <img src="/static/images/retry-with-fifo-message-queue.svg" alt="retry-with-fifo-message-queue" />
  </figure>
</div></section>
