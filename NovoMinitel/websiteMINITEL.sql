if exists (select * from dbo.sysobjects where id = object_id(N'[WN_ListaProdutos]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
 drop table [WN_ListaProdutos]
end
CREATE TABLE [WN_ListaProdutos] (
	[ststamp] [char] (25) DEFAULT (''),
	[ref] [char] (18) DEFAULT (''),
	[design] [char] (60) DEFAULT (''),
	[forref] [char] (20) DEFAULT (''),
	[CAT1] [varchar] (20) DEFAULT (''),
	[CAT2] [varchar] (20) DEFAULT (''),
	[CAT3] [varchar] (35) DEFAULT (''),
	[imagem] [varchar] (120) DEFAULT (''),
	[stock] [numeric](13, 3) DEFAULT (0),
	[Preco] [numeric](19, 6) DEFAULT (0),
	[StockPrevisto] [numeric](13, 3) DEFAULT (0),
	[Descricao] [text] DEFAULT (''),
	[UltimaEntrada] [datetime] NOT NULL DEFAULT (getdate()),
	[Quando] [datetime] NOT NULL DEFAULT (getdate()),
	[SORT1] [numeric](19, 6) NULL DEFAULT (0),
	[SORT2] [numeric](19, 6) NULL DEFAULT (0),
	[SORT3] [numeric](19, 6) NULL DEFAULT (0),
	[SORT4] [numeric](19, 6) NULL DEFAULT (0),
	[SORT5] [numeric](19, 6) NULL DEFAULT (0),
	[CAT_ID1] [numeric](19, 6) NULL DEFAULT (0),
	[CAT_ID2] [numeric](19, 6) NULL DEFAULT (0),
	[CAT_ID3] [numeric](19, 6) NULL DEFAULT (0)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


