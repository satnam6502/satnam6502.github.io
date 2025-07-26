---
layout: personal
title: "2021-10-03. Advice for Whiteboard Coding Interviews"
image: "/images/blackboard.jpg"
tags:
  author: satnam_singh
---

![Coding](/images/blackboard.jpg)

# Advice for Whiteboard Coding Interviews
I’ve recently done a lot of interviewing as a job applicant. Historically I’ve interviewed many candidates myself and I’ve also served on Google’s Hiring Committee for software engineers. While this experience is fresh in my mind, I thought I would jot down a few words of advice, in case it is helpful to anyone else. Let me know!

**Caveat**. The advice here pertains to interviews for software engineer technical positions at big tech companies, although some of it may also be useful for other types of companies and roles. Specifically, this is for interviews that last a day or two, which are structured as a series of 1:1 meetings where you are asked to write code at the whiteboard or in a shared document.

**Whiteboard coding is stressful**. You are alone in a room with someone who is scrutinizing everything you say and do as they write notes about your performance. Many power imbalances are at play. They have succeeded at this process and have a job at the company where you would like to get a job offer. They have asked this question many times and know it inside out, how to solve it very well, and what people usually get wrong. They might be a white male. And in my case, they will probably be half my age or younger. It’s important that in the first few minutes you build up some kind of rapport or friendly tone of communication so you at least get off on the right foot. Bear in mind that, despite the hostile setup, this person probably wants you to succeed. When I interview people, it is with a mindset like “I am going to work as hard as I can to help you demonstrate that you have the skills and ability needed to be a successful employee at this company”.

**Prepare yourself**. Be well fed and hydrated before your interview to ensure your blood sugar level is not too low. Eat a decent breakfast. Bring snacks and water unless you know some will be provided. Don’t go on a drunken bender the night before. Sleep well the night before.

**Practice coding interview questions**. I failed the interview process at Google the first time I applied because I did not prepare and I was not expecting to write generic code on the whiteboard at the drop of a hat. Perhaps you write code every day, either professionally or as a researcher producing prototypes. That is not going to prepare you for the stylized type of coding questions you will get in an interview situation. Get a friend to help you by acting as the interviewer. Google for suitable interview questions depending on the exact type of role you are applying for. Find a room with a whiteboard and rehearse the interview process. Get used to standing at a whiteboard and having to write code and respond to questions from your mock interviewer. Do this a few times. This will help you be more confident when you have to do it for real. Determine in advance what programming languages you are comfortable using to answer interview coding questions, or determine if there is a specific language you have to use. Get as much practice as possible in that language beforehand.

**Demonstrate your problem-solving skills**. A good interviewer is not going to ask you to code up anything big or very complicated. Forget about red-black trees. The primary purpose of the coding interview is to expose your level of analytical problem solving skills and to act as a proxy for assessing other characteristics like dealing with ambiguity. A secondary goal is to assess to some degree your coding skills but the 45 minute whiteboard coding interview is not really fit for purpose for that assessment and gives a very noisy signal. The coding interview is really about how you think and solve problems.

**Make sure you understand what is being asked**. A common error for the candidate is to misunderstand the question and waste time writing correct code for the wrong problem. Don’t be afraid to ask the interviewer to repeat the question or to ask for further details or clarification.

**Write test cases**. Talking through test cases with the interviewer early in the interview will help you understand the problem. Before writing any code, draw up some test cases, or explain a test plan or strategy and pay particular attention to corner cases. Write the test cases on the whiteboard. As you write code, step through the test cases to make sure your code satisfies the tests.

**Write code**. Ensure you have a basic understanding of how the fundamental data structures work in your chosen programming language e.g. hash tables. Do not write pseudo code: do your best to write code which would compile. As you write code, explain each of your decisions e.g. what this data-structure, what is this loop doing, what are the pre-conditions you are assuming. Be sure to deal appropriately with error situations (unless advised to ignore them). Think about under what circumstances your program might crash. Don’t write code for “features that might be useful in the future”. Write just the code required to solve the problem. Don’t write woefully inefficient code, don’t use recursion when a simple loop would do the job. Check: does your code always terminate?

**Address ambiguity**. It’s quite common for the interviewer to leave important aspects deliberately unspecified. Ask questions to help you disambiguate the question. You will be rewarded for this, because spotting and dealing with ambiguity is one of the things being assessed. Talk out loud about design alternatives and their pros and cons, and then justify a particular choice. This might involve interaction with your interviewer to get more context e.g. should you optimize for space or time.  Learn/review and practice talking about space and time tradeoffs of different data structures in your chosen programming language. Have a basic level of understanding of space and time complexity in terms of big-O notation.

**Test your code**. When you’ve finished writing your code, you should then test it by “simulating” it with your test cases, walking through it line by line, acting as a human debugger. Keep talking while you do this.

**Don’t panic**. Don’t say to the interviewer “Is this right?”, “Can you think of a better way of doing this?”, “This is a stupid question”, “Did I pass the interview?”, “Can I do this again when I get home and email it to you?”

**Be formal, polite and respectful**. Remain as calm as possible. You’ll naturally exhibit some excitement at an interesting problem and the challenge of solving it, which is perfectly fine. Be engaged with your interviewer. Make eye contact. Smile (believe me, this does not come naturally to me but a forced smile is better than no smile). Your interviewer will point out mistakes or suggest changes. Don’t apologize. Don’t panic. Thank them gracefully, and calmly fix the error or make the required change. Most errors are not fatal and you are not going to fail the interview because of them. It’s a positive signal that you can understand quickly what has gone wrong and then fix it. If, at the end, it felt like a jazz jamming session, as if “the two of you did it together”, then that’s a pretty positive signal.

**Do your homework**. Sometimes you will be given the names of your interviewers. Look each one of them up on LinkedIn to understand their career background and technical areas of expertise. Have they recently written any papers or blog posts? Read or skim them. This might give you a strong clue about the type of question they may ask you.

**Ask questions**. At the end of the interview you might be asked if you have any questions for the interviewer. It’s safest to ask a banal question like “What do you work on?” or “What is the most rewarding part of your job?”. Avoid negative questions like “What’s the worst aspect of your job?” because you don’t want your interviewer to leave with a negative mindset and then write your interview feedback. 

**Good luck!** Let me know if you found any of this helpful and how you got on in your interviews by commenting on this [Twitter thread](https://twitter.com/satnam6502/status/1444787860704350208).

# See also...
Steve Yegge's blog post [Get that job at Google](https://steve-yegge.blogspot.com/2008/03/get-that-job-at-google.html)
