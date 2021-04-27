using { CatalogService } from '../../srv/catalog-service';

annotate CatalogService.SalesOrders with @(
    UI: {
        SelectionFields  : [
            SalesOrder,
            SalesOrderDate,
            SalesOrderType
        ],
        LineItem  : [
            {
                $Type : 'UI.DataField',
                Label : 'Order ID',
                Value : SalesOrder,
            },
            {
                $Type : 'UI.DataField',
                Value : SalesOrderDate,
            },
            {
                $Type : 'UI.DataField',
                Value : SalesOrderType,
            },
            {
                $Type : 'UI.DataField',
                Value : SalesOrganization,
            }
        ],
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Sales Order',
            TypeNamePlural : 'Sales Orders',
            Title: {
                Label : 'Sales Orders',
                Value: SalesOrderDate
            },
            Description: {
                Label : 'Date',
                Value: SalesOrganization
            },
            ImageUrl : 'https://yt3.ggpht.com/ytc/AAUvwnh3wZ_lF5toqPaf4QiypgoSn9BD5rZQXhC2bvRO3Rc=s900-c-k-c0x00ffffff-no-rj',
        },
        Facets  : [{
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>POGeneralInfo}',
            Target: ![@UI.FieldGroup#HeaderGeneralInformation]
        }
        ],
        FieldGroup#HeaderGeneralInformation  : {
            $Type : 'UI.FieldGroupType',
            Data: [
                {
                    $Type : 'UI.DataField',
                    Value : SalesOrder,
                },
                {
                    $Type : 'UI.DataField',
                    Value : SalesOrderDate,
                },
                {
                    $Type : 'UI.DataField',
                    Value : SalesOrderType,
                },
                {
                    $Type : 'UI.DataField',
                    Value : SalesOrganization,
                },
                {
                    $Type : 'UI.DataField',
                    Value : SoldToParty,
                }
            ]
        },
    }

);