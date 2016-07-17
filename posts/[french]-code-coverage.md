This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License ](http://creativecommons.org/licenses/by-sa/4.0/).

----------
This blog post is a french translation of the Martin Fowler's [TestCoverage](http://martinfowler.com/bliki/TestCoverage.html) article, originally published on his [website](http://martinfowler.com/) on April, 17th in 2012.

----------

# Couverture de code

De temps à autre, j'entends des personnes 1) s'interroger sur quelle devrait être la bonne proportion de couverture de code à atteindre, ou 2) exposer avec fierté leur niveau de couverture de code. Cependant, de telles déclarations passent à côté de l'essentiel. La couverture de code est un outil utile pour trouver quelles parties de votre code ne sont pas testées et a donc peu de valeur pour mesurer à quel point vos tests sont bons.

![Test Coverage Sketch](https://raw.githubusercontent.com/Elgolfin/Blog/master/posts/assets/test-coverage-sketch.png)

Attardons nous en premier lieu à la seconde déclaration. J'ai entendu parler d'endroits où l'on peut dire des choses comme "vous ne pouvez pas aller en production avec une couverture de code inférieure à 87%". J'ai aussi entendu certaines personnes dire que vous devriez utiliser des choses comme TDD et avoir une couverture de code de 100%. Un sage homme a dit, un jour:

> Je m'attends à avoir un niveau de couverture de code élevé. Parfois, certains managers requierent un niveau de couverture précis. La différence est subtile.

>-- Brian Marick

Si vous ciblez un niveau de couverture précis, les gens vont essayer de l'atteindre. Le problème est que les niveaux de couverture elevés sont trop faciles à atteindre avec une mauvaise qualité de test. Au niveau le plus absurde vous obtenez [des tests sans assertion [en]](http://martinfowler.com/bliki/AssertionFreeTesting.html). Mais même sans ça, vous pouvez vous retrouver avec beaucoup de tests concernant des choses tournant rarement mal, ce qui vous distrait de tester les choses qui importent vraiment.

Comme la plupart des aspects de la programmation, tester requiert de la réflexion. Le TDD est un outil très utile pour vous aider à créer de bons tests mais certainement pas auto-suffisant. Si vous testez bien et de façon réfléchie, je m'attendrais à un pourcentage de couverture situé quelque part entre 80% et 90%. Je me méfierai de toute couverture de 100% - je suspecterai plutôt une personne qui a écrit des tests pour façonner une métrique parfaite sans réellement penser à ce qu'elle était en train de faire.

Bien évidemment, la raison pour laquelle les gens se concentrent sur les métriques de couverture de code est qu'ils veulent savoir s'ils font assez de tests. Probablement qu'une couverture de code inférieure à 50% est le signe de problèmes. Mais des métriques élevés ne veulent pas nécessairement dire grand chose non plus et conduit à promouvoir [des tableaux de bord encourageant l'ignorance [en]](http://blog.sriramnarayan.com/2011/04/dashboards-promote-ignorance.html). Déterminer la quantité suffisante de tests est compliqué et un métrique de couverture ne saurait y répondre seul. Je dirai que vous faites suffisamment de tests si les affirmations suivantes sont valides:

1. vous avez rarement des bogues qui se retrouvent en production, et
2. vous hésitez rarement à apporter des changements au code de peur de créer des bogues en production.

Pouvez-vous trop tester ? Bien sûr. Vous faites trop de tests si vous pouvez en enlever tout en ayant encore suffisamment de tests. Mais c'est une chose difficile à percevoir. Un signe pour savoir si vous faites trop de tests est lorsque vos tests vous ralentissent. Si un simple changement dans le code cause des changements excessivement longs au niveau des tests, c'est probablement un signe qu'il y a un problème avec vos tests. Ce n'est pas forcément que vous testez trop de choses mais plutôt que vous avez de la redondance dans vos tests.

Certaines personnes pensent que vous avez trop de tests quand ceux-ci prennent trop longtemps à s'exécuter. Je suis moins convaincu par cet argument. Vous pouvez toujours déplacer l'exécution de ces tests plus loin dans votre pipeline d'intégration continue, ou-même la supprimer de votre pipeline et l'exécuter périodiquement. Le feedback provenant de ces tests prendra plus de temps mais c'est un compromis à faire entre le temps de compilation versus la confiance que vous accordez à vos tests.

Quelle est alors l'utilité d'analyser la couverture de code ? Et bien, cela vous aide à trouver quelles parties de votre ne sont pas testées.<sup id="a1">[1](#f1)</sup> Ça vaut la peine de rouler les outils d'analyse de couverture de temps en temps et de considérer ces parties de code non couvertes par des tests. Vous inquiètent-elles de ne pas être testées ?

> Si une partie de votre suite de tests est fragile dans un sens où la couverture peut le détecter, elle est probablement aussi fragile dans un sens où la couverture ne peut le détecter.

>-- Brian Marick

## Pour aller plus loin

Brian Marick a écrit un excellent article sur [l'usage abusif de la couverture de code [en]](http://www.exampler.com/testing-com/writings/coverage.pdf). Vous pouvez aussi lire l'article [pithy commentary of Testivus [en]](http://www.developertesting.com/archives/month200705/20070504-000425.html) pour approfondir le sujet.

### Notes

<sup id="f1">[1]</sup> Par "vous" je veux dire les personnes qui écrivent les tests. 
La couverture de code a peu de valeur pour le management puisqu'il est nécessaire d'avoir un background technique pour comprendre que soit la qualité des tests est bonne, soit le code non couvert est la source du problème. [↩](#a1)

[![enter image description here](https://i.creativecommons.org/l/by-sa/4.0/80x15.png) ](http://creativecommons.org/licenses/by-sa/4.0/)