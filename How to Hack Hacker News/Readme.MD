[Hacker News](https://news.ycombinator.com/) is a popular website run by Y Combinator. It’s widely known by people in the tech industry as a community site for sharing news, showing off projects, asking questions, among other things.

In this project, you will be working with a table named hacker_news that contains stories from Hacker News since its launch in 2007. It has the following columns:

    title: the title of the story
    user: the user who submitted the story
    score: the score of the story
    timestamp: the time of the story
    url: the link of the story

This data was kindly made publicly available under the MIT license.

1. Start by getting a feel for the hacker_news table!

Let’s find the most popular Hacker News stories:

What are the top five stories with the highest scores?
Hacker News Moderating
<br>

2. Recent studies have found that online forums tend to be dominated by a small percentage of their users (1-9-90 Rule).

Is this true of Hacker News?

Is a small percentage of Hacker News submitters taking the majority of the points?

First, find the total score of all the stories.
<br>

3. Next, we need to pinpoint the users who have accumulated a lot of points across their stories.

Find the individual users who have gotten combined scores of more than 200, and their combined scores.

GROUP BY and HAVING are needed!
<br>

4. Then, we want to add these users’ scores together and divide by the total to get the percentage.

Add their scores together and divide it by the total sum. Like so:

SELECT (1.0 + 2.0 + 3.0) / 6.0;

So, is Hacker News dominated by these users?
<br>

5. Oh no! While we are looking at the power users, some users are rickrolling — tricking readers into clicking on a link to a funny video and claiming that it links to information about coding.

The url of the video is:

https://www.youtube.com/watch?v=dQw4w9WgXcQ

How many times has each offending user posted this link?
Which sites feed Hacker News?
<br>

6. Hacker News stories are essentially links that take users to other websites.

Which of these sites feed Hacker News the most:

_GitHub, Medium, or New York Times?_

Fill in the other WHEN statements and the ELSE statement.
<br>

7. Next, build on the previous query:

Add a column for the number of stories from each URL using COUNT().

Also, GROUP BY the CASE statement.

Remember that you can refer to a column in GROUP BY using a number.
What's the best time to post a story?
<br>

8. Every submitter wants their story to get a high score so that the story makes it to the front page, but…

What’s the best time of the day to post a story on Hacker News?

<br>

9. SQLite comes with a strftime() function - a very powerful function that allows you to return a formatted date.

It takes two arguments:

strftime(format, column)

Let’s test this function out:

SELECT timestamp,
   strftime('%H', timestamp)
FROM hacker_news
GROUP BY 1
LIMIT 20;

What do you think this does? Open the hint if you’d like to learn more.
<br>

10. Okay, now we understand how strftime() works. Let’s write a query that returns three columns:

    The hours of the timestamp
    The average score for each hour
    The count of stories for each hour
<br>

11. Let’s edit a few things in the previous query:

    Round the average scores (ROUND()).

    Rename the columns to make it more readable (AS).

    Add a WHERE clause to filter out the NULL values in timestamp.

Take a look at the result again:

What are the best hours to post a story on Hacker News?
