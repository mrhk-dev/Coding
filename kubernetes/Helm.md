# Helm  
  
* Helm is a widely recognized package manager for Kubernetes that significantly simplifies the deployment and management of applications within Kubernetes clusters.   
	* ### Simplified Application Deployment  
		Helm allows users to deploy applications with minimal effort by utilizing Helm charts, which are collections of YAML files that define all necessary resources for an application.  
		This means that instead of writing multiple YAML files for each component of an application, users can simply download a pre-configured Helm chart and deploy it with a single command.  
		This streamlining reduces complexity and saves time, especially in environments where applications frequently change.  
	* ### Dependency Management  
		One of the standout features of Helm is its ability to manage dependencies between different application components.  
		For example, if an application requires a specific database version, Helm can automatically ensure that the correct version is installed alongside the application.   
		This capability is crucial for maintaining compatibility and stability across various services in a microservices architecture.  
	* ### Versioning and Rollback  
		Helm provides built-in support for versioning applications, which allows users to revert to previous versions easily if issues arise after an update.  
		This rollback feature is vital for maintaining application stability and minimizing downtime.  
		Each installation of a Helm chart creates a unique release, enabling multiple versions of the same application to coexist without conflict.  
	* ### Portability and Reusability  
		Helm charts are portable across different Kubernetes environments, making it easy to replicate configurations in development, staging, and production settings.  
		This portability encourages best practices in configuration management and promotes consistency across deployments35.  
		Additionally, teams can share Helm charts with one another, facilitating collaboration and knowledge sharing within organizations.  


## Install:
* Install Helm 
[Helm Installation Guide]("https://helm.sh/docs/intro/install/")

How to create the ** Helm Template**  
* Enter the command in command prompt **"helm name chart-name"**
	here chart-name is the template name. Ex deployement.yaml
	## Files Structure of Helm
		wordpress/
  			* Chart.yaml          # A YAML file containing information about the chart
  			* LICENSE             # OPTIONAL: A plain text file containing the license for the chart
  			* README.md           # OPTIONAL: A human-readable README file
  			* values.yaml         # The default configuration values for this chart
  			* values.schema.json  # OPTIONAL: A JSON Schema for imposing a structure on the values.yaml file
  			* charts/             # A directory containing any charts upon which this chart depends.
  			* crds/               # Custom Resource Definitions
  			* templates/          # A directory of templates that, when combined with values,
  			                    # will generate valid Kubernetes manifest files.
  			* templates/NOTES.txt # OPTIONAL: A plain text file containing short usage notes

Replace the hardCoded values with variables.

## Helm Variables:
* {{- with .Values.favorite }}
	farorite is the variable inside the **"Values"** file.



[Helm Online Validator/PlayGround](https://helm-playground.com/)



