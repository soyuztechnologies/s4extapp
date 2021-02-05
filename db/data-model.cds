// using an external service from S/4
 namespace s4hextapp.db; 
 
 using {  API_SALES_ORDER_SRV as external } from '../srv/external/API_SALES_ORDER_SRV.csn';

 entity SalesOrders as projection on external.A_SalesOrder {
     key SalesOrder,
     SalesOrganization,
     SalesOrderType,
     SalesOrderDate,
     SoldToParty,
     OverallDeliveryStatus,
     to_Item.Material as Material,
     to_Item.OrderQuantityUnit as OrderQuantityUnit,
     to_Item.NetAmount as NetAmount
  }