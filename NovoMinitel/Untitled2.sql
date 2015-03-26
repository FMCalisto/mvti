if exists (select * from dbo.sysobjects where id = object_id(N'[WN_Fabricante]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
 drop table [WN_Fabricante]
end
CREATE TABLE [WN_Fabricante] (
	[FabricanteID] [numeric](18, 0) IDENTITY (1, 1),
	[Fabricante] [char] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	CONSTRAINT [PK_WN_FabricanteT] PRIMARY KEY  CLUSTERED 
	(
		[FabricanteID]
	)  ON [PRIMARY] 
) ON [PRIMARY]
insert into WN_Fabricante (Fabricante) SELECT DISTINCT TOP 100 PERCENT usr1 
FROM         WebSiteMINITEL_Stock where usr1<>''
ORDER BY usr1

select top 5 * from WebSiteMINITEL_Stock
update WebSiteMINITEL_Stock set Fabricante=WN_Fabricante.Fabricante,FabricanteID=WN_Fabricante.FabricanteID 
from WN_Fabricante inner join WebSiteMINITEL_Stock on WebSiteMINITEL_Stock.usr1=WN_Fabricante.Fabricante  COLLATE SQL_Latin1_General_CP1_CI_AS


select * from WN_Fabricante inner join WebSiteMINITEL_Stock on WebSiteMINITEL_Stock.usr1=WN_Fabricante.Fabricante
