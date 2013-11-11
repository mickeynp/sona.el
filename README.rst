=========
 Sona.el
=========

Emacs wrapper for Sona, the Python-aware search tool.

Installation
============

To install, run::

  M-x package-install RET sona RET

(This requires MELPA)

The old fashioned way. Copy sona.el to a place on your ``load-path`` and add this to your Emacs::

  (require 'sona)


How to Use
==========

Type ``M-x sona`` to use Sona in the same way you would on the commandline. By default Sona will detect if you are running the command from a git backend. If it is, it will adjust ``default-directory`` so Sona will give you the correct results. For this to work, ``vc`` must be enabled and set up to use git. For most people this will just work automatically.

TODOs
=====
Make Sona.el ask for a directory if git is not detected.

