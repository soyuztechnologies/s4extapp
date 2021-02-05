# Getting Started

Welcome to your new project.

It contains these folders and files, following our recommended project layout:

File or Folder | Purpose
---------|----------
`app/` | content for UI frontends goes here
`db/` | your domain models and data go here
`srv/` | your service models and code go here
`package.json` | project metadata and configuration
`readme.md` | this getting started guide


## Next Steps

- Open a new terminal and run `cds watch` 
- (in VS Code simply choose _**Terminal** > Run Task > cds watch_)
- Start adding content, for example, a [db/schema.cds](db/schema.cds).

## Steps by Anubhav

- Create a new project using cds init
- Create extenal folder inside the srv directory
- Download Sales Order API edmx file from api hub
- run cds watch on project and drop edmx inside folder, csn gets created
- create data-model.cds which has abstract entity
- create catalog-service.cds exposing the service from abstract entity
- create catalog-service.js to write hook method for read data from Sales orders in S/4HANA
- Expose the data out of CDS in JSON format by mapping to Entity of CDS

- Go to welcome page and add UI5 project type list report
- 

## Learn More

Learn more at https://cap.cloud.sap/docs/get-started/.
