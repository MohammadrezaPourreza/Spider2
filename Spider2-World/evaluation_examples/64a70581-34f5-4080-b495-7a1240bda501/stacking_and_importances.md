# Stacking & Importances

## Introduction

D.H. Wolpert wrote in his famous paper "Stacked Generalization", that stacked generalization is "…a scheme for minimizing the generalization error rate of one or more generalizers. Stacked generalization works by deducing the biases of the generalizer(s) with respect to a provided learning set. This deduction proceeds by generalizing in a second space whose inputs are (for example) the guesses of the original generalizers when taught with part of the learning set and trying to guess the rest of it, and whose output is (for example) the correct guess".
Basically, a set of models (called L0 level estimator set) is trained on the train set, then a metamodel (also called L1 level estimator, that can be a regression (linear or logistic) or a decision tree) is trained on test set using predictions of the L0 level estimators. We can say that the stacking is successful when the score of the final estimator is better than the best score of the L0 level estimators.
This model can be optimized along two main axes:

- the size of L0 level estimator set
- the number of features.

To reach this goal, we can follow this procedure:

- generate an exploratory data analysis, where the correlation analysis indicates which columns must be dropped
- build a model using stacked generalization
- reduce the size of the L0 level estimator set using model importance (based on the value of the coefficients of the metamodel) 
- reduce the number of features using permutation feature importance computed on the preceding model
- build the final model with the reduced L0 level estimator set and the reduced the number of features
- store information about this process in a SQLite database.

## When is the stacking successful?¶

The stacking is successful, when the score of the stacked estimator is greater (resp. greater or equal) than the maximal score of the estimator in level 0 (on test set) in the strong formulation (resp. in the weak formulation). The stacking result can be 'strong' (in case of strict inequality) or 'soft' (in case of equality).
