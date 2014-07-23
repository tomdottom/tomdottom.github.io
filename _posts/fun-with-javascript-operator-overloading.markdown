---
layout: post
title:  "Fun with javascript operator overloading"
date:   ??
categories: Draft
---

Test

    function Test(num) {
        this.num = num;
    }

    Test.prototype.valueOf = function() {
        return this.num;
    }

    Test.prototype.add = function(testObj) {
        return new this.constructor(this + testObj);
    }

    Test.add = function(a,b) {
        return a.add(b);
    }