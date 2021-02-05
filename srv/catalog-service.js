module.exports = async (srv) => {

    const { SalesOrders } = cds.entities

    const {
        SalesOrder,
        SalesOrderItem
    } = require("@sap/cloud-sdk-vdm-sales-order-service");

    function getSingleSalesOrder(key) {
        return BusinessPartner.requestBuilder()
            .getByKey(key)
            .select(
                BusinessPartner.ACADEMIC_TITLE,
                BusinessPartner.FIRST_NAME,
                BusinessPartner.LAST_NAME
            )
            .execute({
                destinationName: "CFN"
            });
    }

     function getAllSalesOrders() {
        return SalesOrder.requestBuilder()
                .getAll()
                //.filter(SalesOrder.TOTAL_NET_AMOUNT.greaterThan(2000))
                .top(50)
                .select(
                    SalesOrder.SALES_ORDER,
                    SalesOrder.SALES_ORGANIZATION,
                    SalesOrder.SALES_ORDER_TYPE,
                    SalesOrder.SALES_ORDER_DATE,
                    SalesOrder.SOLD_TO_PARTY,
                    SalesOrder.OVERALL_TOTAL_DELIVERY_STATUS,
                    SalesOrder.TO_ITEM.select(SalesOrderItem.MATERIAL, SalesOrderItem.REQUESTED_QUANTITY_UNIT, SalesOrderItem.NET_AMOUNT)
                )
                .execute({
                    url: "http://117.247.238.172:8021/",
                    username: "",
                    password:""
                });
    }

    //const salesService = await cds.connect.to('API_SALES_ORDER');
    srv.on('READ', 'SalesOrders', async (req) => {
        //return await salesService.tx(req).run(req.query);
        return await getAllSalesOrders().then(SalesOrdersTable => {
                console.info("BusinessPartner: ", JSON.stringify(SalesOrdersTable));
                var aRecords = [];
                SalesOrdersTable.forEach(element => {
                    var line = {};
                    line.SalesOrder = element.salesOrder;
                    line.SalesOrganization = element.salesOrganization;
                    line.SalesOrderType = element.salesOrderType;
                    line.SoldToParty = element.soldToParty;
                    //line.SalesOrderDate = new Date(element.salesOrderDate);
                    line.OverallDeliveryStatus = element.overallTotalDeliveryStatus;
                    line.Material = element.toItem[0].material;
                    line.OrderQuantityUnit = element.toItem[0].requestedQuantityUnit;
                    line.NetAmount = element.toItem[0].netAmount;
                    aRecords.push(line);
                });
                return aRecords;
            });
    });


}