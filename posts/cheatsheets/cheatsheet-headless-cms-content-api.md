This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License ](http://creativecommons.org/licenses/by-sa/4.0/).

# Headless CMS / Content API

In a nutshell, it's a CMS with an API.  
For a longer explanation, please refer to [What is a headless CMS?](https://prismic.io/headless-cms-intro)

Main advantages:
* Technologic agnostic (it's API oriented, you can use whatever technology you like to consume your content)
* Content can be used by your website front-end as well all others applications you want (i.e. native mobile application)

## Comparaison of two popular CMS content API

| Features |[Contentful](https://www.contentful.com/)|[Prismic](https://prismic.io/)|
|---|:---:|:---:|
|Multi-Tenant| ✓<sup>[1](#ref1)</sup> | |
|Content-Type| ✓ | ✓ |
|Content-Type Fields Customization| ✓ | |
|Content| ✓ | ✓ |
|Navigation Menu|  | ✓<sup>[2](#ref1)</sup> |
|Media Library| ✓ | ✓ |
|History Revisions|  | ✓ |
|Releases & Scheduling|  | ✓ |
|Localized Web Interface|  |  |
|Localization| ✓ | ✓ |
|Preview Area| ✓ | ✓ |
|Built-in A/B Testing| | ✓ |
|Import/Export Content Types| ✓ |  |
|Import/Export Content| ✓ | ✓<sup>[3](#ref3)</sup> |
|Layout flexibility|   | ✓<sup>[4](#ref4)</sup> <sup>[5](#ref5)</sup>|
|Extensibility| ✓ | |
|Roles| ✓ | ✓ |
|Webhooks| ✓ | ✓ |
|Nice Documentation| ✓ | ✓ |
|Cloud-Only| ✓ | ✓ |
|Recommended Pricing<sup>[6](#ref6)</sup>| [$849/month]() | [$100~300/month](https://prismic.io/pricing)<sup>[7](#ref7)</sup> |
|Open Source|  |  |

<sup><a name="ref1">[1]</a></sup>: Via spaces  
<sup><a name="ref2">[2]</a></sup>: Via custom content type (i.e. navigation content type composed of a collection of repeatable text/link/image)  
<sup><a name="ref3">[3]</a></sup>: The number of documents you can import per batch is limited to 200 documents. And there is a limit of 10 import batches per hour  
<sup><a name="ref4">[4]</a></sup>: Tabs can be used to organize the content fields and make document editing more user-friendly. [Document tab organization](https://intercom.help/prismicio/content-modeling-and-custom-types/structure-your-content/document-tab-organization)  
<sup><a name="ref5">[5]</a></sup>: Slices can be used to define a dynamic zone for richer page layouts. [Slices - How to structure dynamic documents](https://intercom.help/prismicio/content-modeling-and-custom-types/structure-your-content/slices-how-to-structure-dynamic-documents)  
<sup><a name="ref6">[6]</a></sup>: Recommended pricing for most of the enterprises to get the better ratio of features vs. price  
<sup><a name="ref7">[7]</a></sup>: Based on annual price. Add 20% for a monthly price. The difference between the $100 and $300 is the SLA (99,5% API Uptime vs. 99,9%)


[![enter image description here](https://i.creativecommons.org/l/by-sa/4.0/80x15.png) ](http://creativecommons.org/licenses/by-sa/4.0/)