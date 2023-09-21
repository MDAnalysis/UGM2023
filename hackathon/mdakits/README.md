# Build an MDAKit

[MDAKits](https://mdakits.mdanalysis.org/) are
standalone packages containing code using MDAnalysis components that
solve a specific scientific problems or in some form enhances the
functionality of MDAnalysis core library. An MDAKit can be written by
anyone and hosted anywhere.

## Team

The MDAKits team (@ianmkenney, @lilyminium, @fiona-naughton, @IAlibay,
@orbeckst) will work with you on creating an MDAKit.


## About MDAKits...

An MDAKit can be registered in the [MDAKits
registry](https://mdakits.mdanalysis.org/mdakits.html) and thus be
advertised to the whole MDAnalysis community. They will also be
continuously tested against the latest released version and the
current development version of the core MDAnalysis library so that
users and developers have an up-to-date view of the code health of an
MDAKit.

For more details, see our [intro blog post on
MDAKits](https://www.mdanalysis.org/2022/08/24/mdakits-intro/) and the
MDAKits paper: 

> Irfan Alibay, Lily Wang, Fiona Naughton, Ian Kenney, Jonathan Barnoud, 
  Richard J Gowers, and Oliver Beckstein.. *MDAKits: A framework for
  FAIR-compliant molecular simulation analysis.* In Meghann Agarwal,
  Chris Calloway, and Dillon Niederhut, editors, Proceedings of the
  22nd Python in Science Conference (SCIPY 2023), pages 76–84, Austin,
  TX, 2023. doi:
  [10.25080/gerudo-f2bc6f59-00a](https://doi.org/10.25080/gerudo-f2bc6f59-00a).

## Getting started

Pick an idea for a stand-alone feature you, or others, want to see 
possible through MDAnalysis - see the list of 
[project ideas](#work-on-a-kit-based-on-a-requested-feature) below!
We encourage you to discuss any ideas in the lead-up to the hackathon -
look for proposed projects marked `[Project]` on the 
[UGM issue tracker][issue-tracker], and join our [Discord server][discord]
to follow the discussion on the [#hackathon channel][hackathon-channel].

Read our guide on making an MDAKit (https://mdakits.mdanalysis.org/makingakit.html).
(*Additional materials TBA*)

Some other things to keep in mind:
- *Use the MDAnalysis API*: MDAnalysis features a mature API aimed to
promote extensibility. We recommend you see how our collection of base
classes and other existing tools could simplify your Kit and present a
consistent interface to potential users; e.g.  AnalysisBase for
trajectory-based analysis
https://userguide.mdanalysis.org/stable/examples/analysis/custom_trajectory_analysis.html
- *Using external packages*: Many tools and analyses have already been
implemented as stand-alone tools or in other packages. It’s worth
checking to see what’s available - it may be easier to include an external
tool as a dependency than to make a Kit “from scratch”. Keep in mind how
easy it would be to install and move data between MDAnalysis and the
external implementation, and make sure to check the licence
before including it in your Kit.


At the hackathon, the MDAKits team will be around to answer any questions
you may have about making and registering an MDAKit. While we do not require
collaboration, we do encourage you to make use of this opportunity being
surrounded by other enthusiastic MDAnalysis contributors.

## What to work on

### Bring your own idea!

If you’ve ever performed (or want to perform) any analysis/trajectory 
manipulation with MDAnalysis that is not already directly implemented, 
chances are that others will too, and could benefit from the creation 
of an MDAKit! 

If you already have code for this - awesome! You can jump right into 
[turning your code into an MDAKit](https://mdakits.mdanalysis.org/makingakit.html).

If you have an idea but don't yet have code (or it's a work-in-progress) - 
that's also awesome! Here is your opportunity to get things rolling.

In both cases, we recommend you share your idea ahead of the hackathon
by raising an issue on the [UGM issue tracker][issue-tracker] (include
`[project]` in the title, and provide an overview of what your Kit will 
do and any current progress towards this). This will give you a dedicated 
space to share and discuss your idea, get feedback, and 
find interested attendees willing to help make your Kit a reality.
Also post on the [#hackathon][hackathon-channel] discord channel and link 
the issue.


### Work on a kit based on a requested feature

See the [list of Project Ideas](./projects.md). Pick an idea from this
list, or use it to inspire your own Kit idea. Once you've identified a
project you'd like to work on, you can comment as such on the project's
associated issue on the [UGM issue tracker][issue-tracker]. See who else 
is interested, and form a team to tackle the issue together!

[discord]: https://discord.com/invite/sAKgZZnPv4
[hackathon-channel]: https://discord.com/channels/807348386012987462/1152628719354118205
[issue-tracker]: https://github.com/MDAnalysis/UGM2023/issues
