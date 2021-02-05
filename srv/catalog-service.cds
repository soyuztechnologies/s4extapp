using { s4hextapp.db as my } from '../db/data-model';
@path: 'service/CatalogService'
service CatalogService {
//### BEGIN OF DELETE
  //entity BusinessPartners as projection on my.BusinessPartners;
//### END OF DELETE
//### BEGIN OF INSERT
  entity SalesOrders as projection on my.SalesOrders;
  //### END OF INSERT
}