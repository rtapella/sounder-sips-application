cwlVersion: v1.0

# A Package that complies with the Best Practice for Earth Observation Application Package needs to:
#
# * Be a valid CWL document with a single Workflow Class and at least one CommandLineTool Class
# * Define the command-line and respective arguments and container for each CommandLineTool
# * Define the Application parameters
# * Define the Application Design Pattern
# * Define the requirements for runtime environment
#
# The Workflow class steps field orchestrates the execution of the application command line and retrieves all the outputs of the processing steps.

   
class: CommandLineTool
id: sounder_sips_l1b

requirements:
  - class: DockerRequirement
    dockerPull: public.ecr.aws/unity-ads/sounder_sips_l1b_pge:r0.2.0
  
arguments: [
  "$(runtime.outdir)/processed_notebook.ipynb",
  "-p", "input_path", "$(inputs.input_dir)",
  "-p", "output_path", "$(runtime.outdir)",
]
  
inputs:
  input_dir:
    type: Directory
  
outputs:
  output_dir:
    type: Directory
    outputBinding:
      glob: .
  stdout_file:
    type: stdout
  stderr_file:
    type: stderr
  
stdout: l1b_pge_stdout.txt
stderr: l1b_pge_stderr.txt

$namespaces:
  s: https://schema.org/
s:softwareVersion: 1.0.0
schemas:
- http://schema.org/version/9.0/schemaorg-current-http.rdf

s:author: 
  name: James McDuffie
s:citation:
s:codeRepository: 
  url: https://github.jpl.nasa.gov/unity-sds/sips_spss_build
s:contributor: 
  - name: Luca Cinquini
s:dateCreated: 2022-04-14
s:keywords: l1b, thermal, sips, sounder
s:license: All Rights Reserved
s:releaseNotes: Initial release
s:version: 0.1
