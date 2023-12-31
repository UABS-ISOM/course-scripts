USE [upi_AWLT]
GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , NULL,NULL, NULL,NULL, NULL,NULL))
EXEC [upi_AWLT].sys.sp_dropextendedproperty @name=N'MS_Description' 

GO
/****** Object:  StoredProcedure [dbo].[uspPrintError]    Script Date: 29/02/2016 2:19:29 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspPrintError]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspPrintError]
GO
/****** Object:  StoredProcedure [dbo].[uspLogError]    Script Date: 29/02/2016 2:19:29 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspLogError]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspLogError]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[SalesLT].[FK_SalesOrderHeader_Customer_CustomerID]') AND parent_object_id = OBJECT_ID(N'[SalesLT].[SalesOrderHeader]'))
ALTER TABLE [SalesLT].[SalesOrderHeader] DROP CONSTRAINT [FK_SalesOrderHeader_Customer_CustomerID]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[SalesLT].[FK_SalesOrderHeader_Address_ShipTo_AddressID]') AND parent_object_id = OBJECT_ID(N'[SalesLT].[SalesOrderHeader]'))
ALTER TABLE [SalesLT].[SalesOrderHeader] DROP CONSTRAINT [FK_SalesOrderHeader_Address_ShipTo_AddressID]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[SalesLT].[FK_SalesOrderHeader_Address_BillTo_AddressID]') AND parent_object_id = OBJECT_ID(N'[SalesLT].[SalesOrderHeader]'))
ALTER TABLE [SalesLT].[SalesOrderHeader] DROP CONSTRAINT [FK_SalesOrderHeader_Address_BillTo_AddressID]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[SalesLT].[FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID]') AND parent_object_id = OBJECT_ID(N'[SalesLT].[SalesOrderDetail]'))
ALTER TABLE [SalesLT].[SalesOrderDetail] DROP CONSTRAINT [FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[SalesLT].[FK_SalesOrderDetail_Product_ProductID]') AND parent_object_id = OBJECT_ID(N'[SalesLT].[SalesOrderDetail]'))
ALTER TABLE [SalesLT].[SalesOrderDetail] DROP CONSTRAINT [FK_SalesOrderDetail_Product_ProductID]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[SalesLT].[FK_ProductModelProductDescription_ProductModel_ProductModelID]') AND parent_object_id = OBJECT_ID(N'[SalesLT].[ProductModelProductDescription]'))
ALTER TABLE [SalesLT].[ProductModelProductDescription] DROP CONSTRAINT [FK_ProductModelProductDescription_ProductModel_ProductModelID]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[SalesLT].[FK_ProductModelProductDescription_ProductDescription_ProductDescriptionID]') AND parent_object_id = OBJECT_ID(N'[SalesLT].[ProductModelProductDescription]'))
ALTER TABLE [SalesLT].[ProductModelProductDescription] DROP CONSTRAINT [FK_ProductModelProductDescription_ProductDescription_ProductDescriptionID]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[SalesLT].[FK_ProductCategory_ProductCategory_ParentProductCategoryID_ProductCategoryID]') AND parent_object_id = OBJECT_ID(N'[SalesLT].[ProductCategory]'))
ALTER TABLE [SalesLT].[ProductCategory] DROP CONSTRAINT [FK_ProductCategory_ProductCategory_ParentProductCategoryID_ProductCategoryID]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[SalesLT].[FK_Product_ProductModel_ProductModelID]') AND parent_object_id = OBJECT_ID(N'[SalesLT].[Product]'))
ALTER TABLE [SalesLT].[Product] DROP CONSTRAINT [FK_Product_ProductModel_ProductModelID]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[SalesLT].[FK_Product_ProductCategory_ProductCategoryID]') AND parent_object_id = OBJECT_ID(N'[SalesLT].[Product]'))
ALTER TABLE [SalesLT].[Product] DROP CONSTRAINT [FK_Product_ProductCategory_ProductCategoryID]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[SalesLT].[FK_CustomerAddress_Customer_CustomerID]') AND parent_object_id = OBJECT_ID(N'[SalesLT].[CustomerAddress]'))
ALTER TABLE [SalesLT].[CustomerAddress] DROP CONSTRAINT [FK_CustomerAddress_Customer_CustomerID]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[SalesLT].[FK_CustomerAddress_Address_AddressID]') AND parent_object_id = OBJECT_ID(N'[SalesLT].[CustomerAddress]'))
ALTER TABLE [SalesLT].[CustomerAddress] DROP CONSTRAINT [FK_CustomerAddress_Address_AddressID]
GO
/****** Object:  View [SalesLT].[vProductModelCatalogDescription]    Script Date: 29/02/2016 2:19:29 p.m. ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[SalesLT].[vProductModelCatalogDescription]'))
DROP VIEW [SalesLT].[vProductModelCatalogDescription]
GO
/****** Object:  View [SalesLT].[vProductAndDescription]    Script Date: 29/02/2016 2:19:29 p.m. ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[SalesLT].[vProductAndDescription]'))
DROP VIEW [SalesLT].[vProductAndDescription]
GO
/****** Object:  View [SalesLT].[vGetAllCategories]    Script Date: 29/02/2016 2:19:29 p.m. ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[SalesLT].[vGetAllCategories]'))
DROP VIEW [SalesLT].[vGetAllCategories]
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetCustomerInformation]    Script Date: 29/02/2016 2:19:29 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufnGetCustomerInformation]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufnGetCustomerInformation]
GO
/****** Object:  Table [SalesLT].[SalesOrderHeader]    Script Date: 29/02/2016 2:19:29 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SalesLT].[SalesOrderHeader]') AND type in (N'U'))
DROP TABLE [SalesLT].[SalesOrderHeader]
GO
/****** Object:  Table [SalesLT].[SalesOrderDetail]    Script Date: 29/02/2016 2:19:29 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SalesLT].[SalesOrderDetail]') AND type in (N'U'))
DROP TABLE [SalesLT].[SalesOrderDetail]
GO
/****** Object:  Table [SalesLT].[ProductModelProductDescription]    Script Date: 29/02/2016 2:19:29 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SalesLT].[ProductModelProductDescription]') AND type in (N'U'))
DROP TABLE [SalesLT].[ProductModelProductDescription]
GO
/****** Object:  Table [SalesLT].[ProductModel]    Script Date: 29/02/2016 2:19:29 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SalesLT].[ProductModel]') AND type in (N'U'))
DROP TABLE [SalesLT].[ProductModel]
GO
/****** Object:  Table [SalesLT].[ProductDescription]    Script Date: 29/02/2016 2:19:29 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SalesLT].[ProductDescription]') AND type in (N'U'))
DROP TABLE [SalesLT].[ProductDescription]
GO
/****** Object:  Table [SalesLT].[ProductCategory]    Script Date: 29/02/2016 2:19:29 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SalesLT].[ProductCategory]') AND type in (N'U'))
DROP TABLE [SalesLT].[ProductCategory]
GO
/****** Object:  Table [SalesLT].[Product]    Script Date: 29/02/2016 2:19:29 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SalesLT].[Product]') AND type in (N'U'))
DROP TABLE [SalesLT].[Product]
GO
/****** Object:  Table [SalesLT].[CustomerAddress]    Script Date: 29/02/2016 2:19:29 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SalesLT].[CustomerAddress]') AND type in (N'U'))
DROP TABLE [SalesLT].[CustomerAddress]
GO
/****** Object:  Table [SalesLT].[Customer]    Script Date: 29/02/2016 2:19:29 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SalesLT].[Customer]') AND type in (N'U'))
DROP TABLE [SalesLT].[Customer]
GO
/****** Object:  Table [SalesLT].[Address]    Script Date: 29/02/2016 2:19:29 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SalesLT].[Address]') AND type in (N'U'))
DROP TABLE [SalesLT].[Address]
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 29/02/2016 2:19:29 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ErrorLog]') AND type in (N'U'))
DROP TABLE [dbo].[ErrorLog]
GO
/****** Object:  Table [dbo].[BuildVersion]    Script Date: 29/02/2016 2:19:29 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BuildVersion]') AND type in (N'U'))
DROP TABLE [dbo].[BuildVersion]
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetSalesOrderStatusText]    Script Date: 29/02/2016 2:19:29 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufnGetSalesOrderStatusText]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufnGetSalesOrderStatusText]
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetAllCategories]    Script Date: 29/02/2016 2:19:29 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufnGetAllCategories]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufnGetAllCategories]
GO
/****** Object:  UserDefinedDataType [dbo].[Phone]    Script Date: 29/02/2016 2:19:29 p.m. ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'Phone' AND ss.name = N'dbo')
DROP TYPE [dbo].[Phone]
GO
/****** Object:  UserDefinedDataType [dbo].[OrderNumber]    Script Date: 29/02/2016 2:19:29 p.m. ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'OrderNumber' AND ss.name = N'dbo')
DROP TYPE [dbo].[OrderNumber]
GO
/****** Object:  UserDefinedDataType [dbo].[NameStyle]    Script Date: 29/02/2016 2:19:29 p.m. ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'NameStyle' AND ss.name = N'dbo')
DROP TYPE [dbo].[NameStyle]
GO
/****** Object:  UserDefinedDataType [dbo].[Name]    Script Date: 29/02/2016 2:19:29 p.m. ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'Name' AND ss.name = N'dbo')
DROP TYPE [dbo].[Name]
GO
/****** Object:  UserDefinedDataType [dbo].[Flag]    Script Date: 29/02/2016 2:19:29 p.m. ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'Flag' AND ss.name = N'dbo')
DROP TYPE [dbo].[Flag]
GO
/****** Object:  UserDefinedDataType [dbo].[AccountNumber]    Script Date: 29/02/2016 2:19:29 p.m. ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'AccountNumber' AND ss.name = N'dbo')
DROP TYPE [dbo].[AccountNumber]
GO
/****** Object:  XmlSchemaCollection [ProductDescriptionSchemaCollection]    Script Date: 29/02/2016 2:19:29 p.m. ******/
IF  EXISTS (SELECT * FROM sys.xml_schema_collections c, sys.schemas s WHERE c.schema_id = s.schema_id AND (quotename(s.name) + '.' + quotename(c.name)) = N'[SalesLT].[ProductDescriptionSchemaCollection]')
DROP XML SCHEMA COLLECTION  [SalesLT].[ProductDescriptionSchemaCollection]
GO
/****** Object:  Schema [SalesLT]    Script Date: 29/02/2016 2:19:29 p.m. ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'SalesLT')
DROP SCHEMA [SalesLT]
GO
