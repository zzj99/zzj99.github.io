---
title: Equilibration in molecular dynamics simulations
date: 2018-03-20 21:37:06
tags: 
  - MD
categories:
  - Literature
mathjax: true
---

# RMSD analysis: a method to detect when the stationary state is attained

[L. Stella, and S. Melchionna, "Equilibration and sampling in molecular dynamics simulations of biomolecules", The Journal of Chemical Physics 109, 10115 (1998)](https://aip.scitation.org/doi/pdf/10.1063/1.477703)


- Relaxation usuallys lasts for tens or hundreds of picoseconds before the system reaches a stationary state.

- A proper equilibration of the system is generally slower than the relaxation of the potential energy.

- A common practice in the analysis of MD simulations of biopolymers is to follow the structural evolution of the macromolecule by monitoring the RMSD of the conformation at a given time of the simulation from the initial structure.

$$ 
{\text{RMSD}}(t_0, t) = \min_{T,R} 
\left\{
\sqrt{\frac{1}{N} \sum_{i=1}^N
\lvert \mathbf{r}_i(t_0) - \mathbf{r}_i(t) \rvert{}^2 }
\right\} 
$$
where the $\mathbf{r}_i$ represents the position vectors of the $N$ protein atoms and 
$\min_{T,R}$ indicates the minimization against rotation and translation of one structure with respect to the other, i.e., the elimination of spurious rigid body relative motions between the two compared structures.

Below is the figure from the literature, which shows ~200 ps is the equilibration time for the test case.
![](/images/eq-md-rmsd-Stella1998.png)

