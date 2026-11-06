---
layout: post
title: "Formally verifying systolic array matrix multipliers with Aristotle"
description: "Links to Aristotle formal verification reports for FP16 systolic array matrix multipliers at sizes 4x4 up to 64x64, each verified directly against a high level functional specification."
image: "/images/systolic-matrix-mul-fv/systolic-4x4.jpg"
permalink: /systolic-matrix-mul-fv/
tags:
  author: satnam_singh
---
# Formally verifying systolic array matrix multipliers with Aristotle

This thread contains links to Aristotle formal verification reports for a systolic array matrix multiplier at sizes 4x4, 8x8, 16x16, 32x32 and 64x64 for FP16 values. You can read the properties that were formally verified in Lean 4, see the SystemVerliog code, and read the verification summary. The formal verification is a direct comparison against a high level functional specification of a pipelined systolic matrix multiplier. I think this kind of direct formal verification of a matrix like this against a fairly direct high level specification is unusual.

## 4x4

[![A 4x4 systolic array of processing elements PE(i,j), with rows of A fed from the left and columns of B fed from the top, and a miniature of every cycle from t = 0 to t = 10.](/images/systolic-matrix-mul-fv/systolic-4x4.jpg)](/images/systolic-matrix-mul-fv/systolic-4x4.jpg)

<https://aristotle.harmonic.fun/projects/be0e5f8b-8206-4667-8773-3e8fd849fc7d>

## 8x8

[![The 8x8 systolic array matrix multiplier.](/images/systolic-matrix-mul-fv/systolic-8x8.jpg)](/images/systolic-matrix-mul-fv/systolic-8x8.jpg)

<https://aristotle.harmonic.fun/projects/0a8ebdf7-e12e-4630-9005-235ce50b7b6b>

## 16x16

[![The 16x16 systolic array matrix multiplier.](/images/systolic-matrix-mul-fv/systolic-16x16.jpg)](/images/systolic-matrix-mul-fv/systolic-16x16.jpg)

<https://aristotle.harmonic.fun/projects/3a4c7300-3caa-464d-9e90-3dce986e4f44>

## 32x32

[![The 32x32 systolic array matrix multiplier.](/images/systolic-matrix-mul-fv/systolic-32x32.jpg)](/images/systolic-matrix-mul-fv/systolic-32x32.jpg)

<https://aristotle.harmonic.fun/projects/6f9facb7-678a-409e-98d3-d822c6c743ee>

## 64x64

[![The 64x64 systolic array matrix multiplier.](/images/systolic-matrix-mul-fv/systolic-64x64.jpg)](/images/systolic-matrix-mul-fv/systolic-64x64.jpg)

<https://aristotle.harmonic.fun/projects/45d1b990-d499-484b-b456-e9a4113affda>

*Tap or click an image to open it at full resolution.*

## How the multipliers were produced and specified

The systolic array matrix multipliers were AI generated, along with tests. The process to produce them also involved mutation tests to break the implementation and make sure the correctness theorem no longer prover (to ensure the theorem connected the specification to the implementation).

The SystemVerilog specification is a fairly direct transcription of this, which captures the same/time pipelined behavior of the systolic array matrix multiplier (for the N=4 case):

[![The specification: c(i,j) equals the sum over t from 0 to 3N−3 and over k from 0 to N−1 of a(i,k) · b(k,j) · δ(t, i+j+k).](/images/systolic-matrix-mul-fv/spec-equation.jpg)](/images/systolic-matrix-mul-fv/spec-equation.jpg)

*This post was originally published as a [thread on X](https://x.com/satnam6502/status/2118782072319795303).*
