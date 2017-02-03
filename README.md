# MovieRecommender
ML-based Movie recommendation 
2.1 Movie ratings dataset
The rst part of the script ex8 cofi.m will load the dataset ex8 movies.mat,
providing the variables Y and R in your Octave/MATLAB environment.

The matrix Y (a num movies  num users matrix) stores the ratings y(i;j)
(from 1 to 5). The matrix R is an binary-valued indicator matrix, where
R(i; j) = 1 if user j gave a rating to movie i, and R(i; j) = 0 otherwise. The
objective of collaborative ltering is to predict movie ratings for the movies
that users have not yet rated, that is, the entries with R(i; j) = 0. This will
allow us to recommend the movies with the highest predicted ratings to the
user.

2.3.1 Recommendations

Top recommendations for you:
Predicting rating 9.0 for movie Titanic (1997)
Predicting rating 8.9 for movie Star Wars (1977)
Predicting rating 8.8 for movie Shawshank Redemption, The (1994)
Predicting rating 8.5 for movie As Good As It Gets (1997)
Predicting rating 8.5 for movie Good Will Hunting (1997)
Predicting rating 8.5 for movie Usual Suspects, The (1995)
Predicting rating 8.5 for movie Schindler's List (1993)
Predicting rating 8.4 for movie Raiders of the Lost Ark (1981)
Predicting rating 8.4 for movie Empire Strikes Back, The (1980)
Predicting rating 8.4 for movie Braveheart (1995)
Original ratings provided:
Rated 4 for Toy Story (1995)
Rated 3 for Twelve Monkeys (1995)
Rated 5 for Usual Suspects, The (1995)
Rated 4 for Outbreak (1995)
Rated 5 for Shawshank Redemption, The (1994)
Rated 3 for While You Were Sleeping (1995)
Rated 5 for Forrest Gump (1994)
Rated 2 for Silence of the Lambs, The (1991)
Rated 4 for Alien (1979)
Rated 5 for Die Hard 2 (1990)
Rated 5 for Sphere (1998)

