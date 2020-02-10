Background
""""""""""

Summary
=======

[.text-justify]
This document is describing the full process that allows to assign DOI (Digital Object Identifier) to a dataset. 


What is a DOI?
==============

A DOI is a unique, persistent and web resolvable identifier (PID), that uniquely and persistenty resolve to a digital resource. 
DOIs are a key element to make digital resource findable on the web, thus allowing for an easy discovey of a resource. Additionally 
they can be used when citing a specific resource on the web. 

DOIs practically consists of an alphanumeric string


Background: FAIRness of data 
============================

The FAIR data principles ....

Findability

Assigning a PID to a digital resource adheres with the first principle of FAIRness, as defined in XXX. 
Making a resource findable is the first step to allow for sharing of data. 

=== Accessibility ===

=== Interoperability ===

=== Reusability ===
Reusability of data is strictly related with the 


== Creating a Dataset ==


== Supplying the right Metadata ==

=== Delivering ACDD compliant metadata ===
=== Compiling the metadata collection webform ===


== Creation of MMD files and storage ==

Once a dataprovider has requested a DOI for a specific dataset, metadata information are extracted. Creation of an xml file containing mmd entries can 
be extracting using the nc-to-mmd.pl tool when netCDF/ACDD compliant files are provided. or by exporting the metadata collection form in an xml file 


== Creation of landing pages and assignment of DOI ==

Landing pages for datasets which require a DOI will be automatically created on the https://adc.met.no/[adc.met.no] data portal starting from the 
available metadata, upon request from the data provider. Only administrators of the data portal has access to this service and are thus the only ones 
who can finalize the process of assigning DOI. 

A Drupal 7 module has been developed, implemented and configured on the https://adc.met.no/[adc.met.no] data portal. The source code with detailed explanation 
on how to implement this solution is openly available at: 

https://github.com/ferrighi/landing_page_creator



