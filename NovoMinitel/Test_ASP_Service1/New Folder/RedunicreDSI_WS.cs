using System;
using System.Collections;
using System.Data;
using OutSystems.HubEdition.RuntimePlatform;
using GotDotNet.ApplicationBlocks;

namespace OutSystems.NssRedunicreDSI_WS {

	public class CssRedunicreDSI_WS: IssRedunicreDSI_WS {

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ExecFuncCompletedEventArgsUserStateGet:
		///         Target: Property UserState: object
		///         Declaring Type: RedunicreDSI.WS.ExecFuncCompletedEventArgs
		///         Parameters:
		///             This_ExecFuncCompletedEventArgs(Object &lt;- RedunicreDSI.WS.ExecFuncCompletedEventArgs): Parameter added to hold the object instance to invoke
		///             UserState(Object &lt;- object): Value of the Property
		/// </summary>
		/// <param name="ssThis_ExecFuncCompletedEventArgs"></param>
		/// <param name="ssUserState"></param>
		public void MssExecFuncCompletedEventArgsUserStateGet(object ssThis_ExecFuncCompletedEventArgs, out object ssUserState) {
			ssUserState = null;
			// Implementation for action
			ssUserState = ((RedunicreDSI.WS.ExecFuncCompletedEventArgs) ssThis_ExecFuncCompletedEventArgs).UserState;
		} // MssExecFuncCompletedEventArgsUserStateGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ExecFuncCompletedEventArgsErrorGet:
		///         Target: Property Error: System.Exception
		///         Declaring Type: RedunicreDSI.WS.ExecFuncCompletedEventArgs
		///         Parameters:
		///             This_ExecFuncCompletedEventArgs(Object &lt;- RedunicreDSI.WS.ExecFuncCompletedEventArgs): Parameter added to hold the object instance to invoke
		///             Error(Object &lt;- System.Exception): Value of the Property
		/// </summary>
		/// <param name="ssThis_ExecFuncCompletedEventArgs"></param>
		/// <param name="ssError"></param>
		public void MssExecFuncCompletedEventArgsErrorGet(object ssThis_ExecFuncCompletedEventArgs, out object ssError) {
			ssError = null;
			// Implementation for action
			ssError = ((RedunicreDSI.WS.ExecFuncCompletedEventArgs) ssThis_ExecFuncCompletedEventArgs).Error;
		} // MssExecFuncCompletedEventArgsErrorGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ExecFuncCompletedEventArgsCancelledGet:
		///         Target: Property Cancelled: bool
		///         Declaring Type: RedunicreDSI.WS.ExecFuncCompletedEventArgs
		///         Parameters:
		///             This_ExecFuncCompletedEventArgs(Object &lt;- RedunicreDSI.WS.ExecFuncCompletedEventArgs): Parameter added to hold the object instance to invoke
		///             Cancelled(Boolean &lt;- bool): Value of the Property
		/// </summary>
		/// <param name="ssThis_ExecFuncCompletedEventArgs"></param>
		/// <param name="ssCancelled"></param>
		public void MssExecFuncCompletedEventArgsCancelledGet(object ssThis_ExecFuncCompletedEventArgs, out bool ssCancelled) {
			ssCancelled = false;
			// Implementation for action
			ssCancelled = ((RedunicreDSI.WS.ExecFuncCompletedEventArgs) ssThis_ExecFuncCompletedEventArgs).Cancelled;
		} // MssExecFuncCompletedEventArgsCancelledGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ExecFuncCompletedEventArgsResultGet:
		///         Target: Property Result: RedunicreDSI.WS.ClassGlobalInfo
		///         Declaring Type: RedunicreDSI.WS.ExecFuncCompletedEventArgs
		///         Parameters:
		///             This_ExecFuncCompletedEventArgs(Object &lt;- RedunicreDSI.WS.ExecFuncCompletedEventArgs): Parameter added to hold the object instance to invoke
		///             Result(Object &lt;- RedunicreDSI.WS.ClassGlobalInfo): Value of the Property
		/// </summary>
		/// <param name="ssThis_ExecFuncCompletedEventArgs"></param>
		/// <param name="ssResult"></param>
		public void MssExecFuncCompletedEventArgsResultGet(object ssThis_ExecFuncCompletedEventArgs, out object ssResult) {
			ssResult = null;
			// Implementation for action
			ssResult = ((RedunicreDSI.WS.ExecFuncCompletedEventArgs) ssThis_ExecFuncCompletedEventArgs).Result;
		} // MssExecFuncCompletedEventArgsResultGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ListFuncsCompletedEventArgsUserStateGet:
		///         Target: Property UserState: object
		///         Declaring Type: RedunicreDSI.WS.ListFuncsCompletedEventArgs
		///         Parameters:
		///             This_ListFuncsCompletedEventArgs(Object &lt;- RedunicreDSI.WS.ListFuncsCompletedEventArgs): Parameter added to hold the object instance to invoke
		///             UserState(Object &lt;- object): Value of the Property
		/// </summary>
		/// <param name="ssThis_ListFuncsCompletedEventArgs"></param>
		/// <param name="ssUserState"></param>
		public void MssListFuncsCompletedEventArgsUserStateGet(object ssThis_ListFuncsCompletedEventArgs, out object ssUserState) {
			ssUserState = null;
			// Implementation for action
			ssUserState = ((RedunicreDSI.WS.ListFuncsCompletedEventArgs) ssThis_ListFuncsCompletedEventArgs).UserState;
		} // MssListFuncsCompletedEventArgsUserStateGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ListFuncsCompletedEventArgsErrorGet:
		///         Target: Property Error: System.Exception
		///         Declaring Type: RedunicreDSI.WS.ListFuncsCompletedEventArgs
		///         Parameters:
		///             This_ListFuncsCompletedEventArgs(Object &lt;- RedunicreDSI.WS.ListFuncsCompletedEventArgs): Parameter added to hold the object instance to invoke
		///             Error(Object &lt;- System.Exception): Value of the Property
		/// </summary>
		/// <param name="ssThis_ListFuncsCompletedEventArgs"></param>
		/// <param name="ssError"></param>
		public void MssListFuncsCompletedEventArgsErrorGet(object ssThis_ListFuncsCompletedEventArgs, out object ssError) {
			ssError = null;
			// Implementation for action
			ssError = ((RedunicreDSI.WS.ListFuncsCompletedEventArgs) ssThis_ListFuncsCompletedEventArgs).Error;
		} // MssListFuncsCompletedEventArgsErrorGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ListFuncsCompletedEventArgsCancelledGet:
		///         Target: Property Cancelled: bool
		///         Declaring Type: RedunicreDSI.WS.ListFuncsCompletedEventArgs
		///         Parameters:
		///             This_ListFuncsCompletedEventArgs(Object &lt;- RedunicreDSI.WS.ListFuncsCompletedEventArgs): Parameter added to hold the object instance to invoke
		///             Cancelled(Boolean &lt;- bool): Value of the Property
		/// </summary>
		/// <param name="ssThis_ListFuncsCompletedEventArgs"></param>
		/// <param name="ssCancelled"></param>
		public void MssListFuncsCompletedEventArgsCancelledGet(object ssThis_ListFuncsCompletedEventArgs, out bool ssCancelled) {
			ssCancelled = false;
			// Implementation for action
			ssCancelled = ((RedunicreDSI.WS.ListFuncsCompletedEventArgs) ssThis_ListFuncsCompletedEventArgs).Cancelled;
		} // MssListFuncsCompletedEventArgsCancelledGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ListFuncsCompletedEventArgsResultGet:
		///         Target: Property Result: RedunicreDSI.WS.ClassListFuncs
		///         Declaring Type: RedunicreDSI.WS.ListFuncsCompletedEventArgs
		///         Parameters:
		///             This_ListFuncsCompletedEventArgs(Object &lt;- RedunicreDSI.WS.ListFuncsCompletedEventArgs): Parameter added to hold the object instance to invoke
		///             Result(Object &lt;- RedunicreDSI.WS.ClassListFuncs): Value of the Property
		/// </summary>
		/// <param name="ssThis_ListFuncsCompletedEventArgs"></param>
		/// <param name="ssResult"></param>
		public void MssListFuncsCompletedEventArgsResultGet(object ssThis_ListFuncsCompletedEventArgs, out object ssResult) {
			ssResult = null;
			// Implementation for action
			ssResult = ((RedunicreDSI.WS.ListFuncsCompletedEventArgs) ssThis_ListFuncsCompletedEventArgs).Result;
		} // MssListFuncsCompletedEventArgsResultGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassInfoValueSet:
		///         Target: Property value: string
		///         Declaring Type: RedunicreDSI.WS.ClassInfo
		///         Parameters:
		///             This_ClassInfo(Object &lt;- RedunicreDSI.WS.ClassInfo): Parameter added to hold the object instance to invoke
		///             value(Text &lt;- string): Value used to set the Property
		/// </summary>
		/// <param name="ssThis_ClassInfo"></param>
		/// <param name="ssvalue"></param>
		public void MssClassInfoValueSet(object ssThis_ClassInfo, string ssvalue) {
			// Implementation for action
			((RedunicreDSI.WS.ClassInfo) ssThis_ClassInfo).value = ssvalue;
		} // MssClassInfoValueSet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassInfoValueGet:
		///         Target: Property value: string
		///         Declaring Type: RedunicreDSI.WS.ClassInfo
		///         Parameters:
		///             This_ClassInfo(Object &lt;- RedunicreDSI.WS.ClassInfo): Parameter added to hold the object instance to invoke
		///             value(Text &lt;- string): Value of the Property
		/// </summary>
		/// <param name="ssThis_ClassInfo"></param>
		/// <param name="ssvalue"></param>
		public void MssClassInfoValueGet(object ssThis_ClassInfo, out string ssvalue) {
			ssvalue = string.Empty;
			// Implementation for action
			ssvalue = ((RedunicreDSI.WS.ClassInfo) ssThis_ClassInfo).value;
		} // MssClassInfoValueGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassInfoKeySet:
		///         Target: Property key: string
		///         Declaring Type: RedunicreDSI.WS.ClassInfo
		///         Parameters:
		///             This_ClassInfo(Object &lt;- RedunicreDSI.WS.ClassInfo): Parameter added to hold the object instance to invoke
		///             key(Text &lt;- string): Value used to set the Property
		/// </summary>
		/// <param name="ssThis_ClassInfo"></param>
		/// <param name="sskey"></param>
		public void MssClassInfoKeySet(object ssThis_ClassInfo, string sskey) {
			// Implementation for action
			((RedunicreDSI.WS.ClassInfo) ssThis_ClassInfo).key = sskey;
		} // MssClassInfoKeySet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassInfoKeyGet:
		///         Target: Property key: string
		///         Declaring Type: RedunicreDSI.WS.ClassInfo
		///         Parameters:
		///             This_ClassInfo(Object &lt;- RedunicreDSI.WS.ClassInfo): Parameter added to hold the object instance to invoke
		///             key(Text &lt;- string): Value of the Property
		/// </summary>
		/// <param name="ssThis_ClassInfo"></param>
		/// <param name="sskey"></param>
		public void MssClassInfoKeyGet(object ssThis_ClassInfo, out string sskey) {
			sskey = string.Empty;
			// Implementation for action
			sskey = ((RedunicreDSI.WS.ClassInfo) ssThis_ClassInfo).key;
		} // MssClassInfoKeyGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassGlobalInfoCodRetSet:
		///         Target: Property codRet: int
		///         Declaring Type: RedunicreDSI.WS.ClassGlobalInfo
		///         Parameters:
		///             This_ClassGlobalInfo(Object &lt;- RedunicreDSI.WS.ClassGlobalInfo): Parameter added to hold the object instance to invoke
		///             codRet(Integer &lt;- int): Value used to set the Property
		/// </summary>
		/// <param name="ssThis_ClassGlobalInfo"></param>
		/// <param name="sscodRet"></param>
		public void MssClassGlobalInfoCodRetSet(object ssThis_ClassGlobalInfo, int sscodRet) {
			// Implementation for action
			((RedunicreDSI.WS.ClassGlobalInfo) ssThis_ClassGlobalInfo).codRet = sscodRet;
		} // MssClassGlobalInfoCodRetSet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassGlobalInfoCodRetGet:
		///         Target: Property codRet: int
		///         Declaring Type: RedunicreDSI.WS.ClassGlobalInfo
		///         Parameters:
		///             This_ClassGlobalInfo(Object &lt;- RedunicreDSI.WS.ClassGlobalInfo): Parameter added to hold the object instance to invoke
		///             codRet(Integer &lt;- int): Value of the Property
		/// </summary>
		/// <param name="ssThis_ClassGlobalInfo"></param>
		/// <param name="sscodRet"></param>
		public void MssClassGlobalInfoCodRetGet(object ssThis_ClassGlobalInfo, out int sscodRet) {
			sscodRet = 0;
			// Implementation for action
			sscodRet = ((RedunicreDSI.WS.ClassGlobalInfo) ssThis_ClassGlobalInfo).codRet;
		} // MssClassGlobalInfoCodRetGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassGlobalInfoInfoSet:
		///         Target: Property info: RedunicreDSI.WS.ClassInfo[]
		///         Declaring Type: RedunicreDSI.WS.ClassGlobalInfo
		///         Parameters:
		///             This_ClassGlobalInfo(Object &lt;- RedunicreDSI.WS.ClassGlobalInfo): Parameter added to hold the object instance to invoke
		///             info(Object &lt;- RedunicreDSI.WS.ClassInfo[]): Value used to set the Property
		/// </summary>
		/// <param name="ssThis_ClassGlobalInfo"></param>
		/// <param name="ssinfo"></param>
		public void MssClassGlobalInfoInfoSet(object ssThis_ClassGlobalInfo, object ssinfo) {
			// Implementation for action
			((RedunicreDSI.WS.ClassGlobalInfo) ssThis_ClassGlobalInfo).info = (RedunicreDSI.WS.ClassInfo[]) ssinfo;
		} // MssClassGlobalInfoInfoSet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassGlobalInfoInfoGet:
		///         Target: Property info: RedunicreDSI.WS.ClassInfo[]
		///         Declaring Type: RedunicreDSI.WS.ClassGlobalInfo
		///         Parameters:
		///             This_ClassGlobalInfo(Object &lt;- RedunicreDSI.WS.ClassGlobalInfo): Parameter added to hold the object instance to invoke
		///             info(Object &lt;- RedunicreDSI.WS.ClassInfo[]): Value of the Property
		/// </summary>
		/// <param name="ssThis_ClassGlobalInfo"></param>
		/// <param name="ssinfo"></param>
		public void MssClassGlobalInfoInfoGet(object ssThis_ClassGlobalInfo, out object ssinfo) {
			ssinfo = null;
			// Implementation for action
			ssinfo = ((RedunicreDSI.WS.ClassGlobalInfo) ssThis_ClassGlobalInfo).info;
		} // MssClassGlobalInfoInfoGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassFuncDescricaoSet:
		///         Target: Property Descricao: string
		///         Declaring Type: RedunicreDSI.WS.ClassFunc
		///         Parameters:
		///             This_ClassFunc(Object &lt;- RedunicreDSI.WS.ClassFunc): Parameter added to hold the object instance to invoke
		///             Descricao(Text &lt;- string): Value used to set the Property
		/// </summary>
		/// <param name="ssThis_ClassFunc"></param>
		/// <param name="ssDescricao"></param>
		public void MssClassFuncDescricaoSet(object ssThis_ClassFunc, string ssDescricao) {
			// Implementation for action
			((RedunicreDSI.WS.ClassFunc) ssThis_ClassFunc).Descricao = ssDescricao;
		} // MssClassFuncDescricaoSet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassFuncDescricaoGet:
		///         Target: Property Descricao: string
		///         Declaring Type: RedunicreDSI.WS.ClassFunc
		///         Parameters:
		///             This_ClassFunc(Object &lt;- RedunicreDSI.WS.ClassFunc): Parameter added to hold the object instance to invoke
		///             Descricao(Text &lt;- string): Value of the Property
		/// </summary>
		/// <param name="ssThis_ClassFunc"></param>
		/// <param name="ssDescricao"></param>
		public void MssClassFuncDescricaoGet(object ssThis_ClassFunc, out string ssDescricao) {
			ssDescricao = string.Empty;
			// Implementation for action
			ssDescricao = ((RedunicreDSI.WS.ClassFunc) ssThis_ClassFunc).Descricao;
		} // MssClassFuncDescricaoGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassFuncFuncionalidade_IdSet:
		///         Target: Property Funcionalidade_Id: int
		///         Declaring Type: RedunicreDSI.WS.ClassFunc
		///         Parameters:
		///             This_ClassFunc(Object &lt;- RedunicreDSI.WS.ClassFunc): Parameter added to hold the object instance to invoke
		///             Funcionalidade_Id(Integer &lt;- int): Value used to set the Property
		/// </summary>
		/// <param name="ssThis_ClassFunc"></param>
		/// <param name="ssFuncionalidade_Id"></param>
		public void MssClassFuncFuncionalidade_IdSet(object ssThis_ClassFunc, int ssFuncionalidade_Id) {
			// Implementation for action
			((RedunicreDSI.WS.ClassFunc) ssThis_ClassFunc).Funcionalidade_Id = ssFuncionalidade_Id;
		} // MssClassFuncFuncionalidade_IdSet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassFuncFuncionalidade_IdGet:
		///         Target: Property Funcionalidade_Id: int
		///         Declaring Type: RedunicreDSI.WS.ClassFunc
		///         Parameters:
		///             This_ClassFunc(Object &lt;- RedunicreDSI.WS.ClassFunc): Parameter added to hold the object instance to invoke
		///             Funcionalidade_Id(Integer &lt;- int): Value of the Property
		/// </summary>
		/// <param name="ssThis_ClassFunc"></param>
		/// <param name="ssFuncionalidade_Id"></param>
		public void MssClassFuncFuncionalidade_IdGet(object ssThis_ClassFunc, out int ssFuncionalidade_Id) {
			ssFuncionalidade_Id = 0;
			// Implementation for action
			ssFuncionalidade_Id = ((RedunicreDSI.WS.ClassFunc) ssThis_ClassFunc).Funcionalidade_Id;
		} // MssClassFuncFuncionalidade_IdGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassFuncEstabelecimentoSet:
		///         Target: Property Estabelecimento: string
		///         Declaring Type: RedunicreDSI.WS.ClassFunc
		///         Parameters:
		///             This_ClassFunc(Object &lt;- RedunicreDSI.WS.ClassFunc): Parameter added to hold the object instance to invoke
		///             Estabelecimento(Text &lt;- string): Value used to set the Property
		/// </summary>
		/// <param name="ssThis_ClassFunc"></param>
		/// <param name="ssEstabelecimento"></param>
		public void MssClassFuncEstabelecimentoSet(object ssThis_ClassFunc, string ssEstabelecimento) {
			// Implementation for action
			((RedunicreDSI.WS.ClassFunc) ssThis_ClassFunc).Estabelecimento = ssEstabelecimento;
		} // MssClassFuncEstabelecimentoSet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassFuncEstabelecimentoGet:
		///         Target: Property Estabelecimento: string
		///         Declaring Type: RedunicreDSI.WS.ClassFunc
		///         Parameters:
		///             This_ClassFunc(Object &lt;- RedunicreDSI.WS.ClassFunc): Parameter added to hold the object instance to invoke
		///             Estabelecimento(Text &lt;- string): Value of the Property
		/// </summary>
		/// <param name="ssThis_ClassFunc"></param>
		/// <param name="ssEstabelecimento"></param>
		public void MssClassFuncEstabelecimentoGet(object ssThis_ClassFunc, out string ssEstabelecimento) {
			ssEstabelecimento = string.Empty;
			// Implementation for action
			ssEstabelecimento = ((RedunicreDSI.WS.ClassFunc) ssThis_ClassFunc).Estabelecimento;
		} // MssClassFuncEstabelecimentoGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassListFuncsCodRetSet:
		///         Target: Property codRet: int
		///         Declaring Type: RedunicreDSI.WS.ClassListFuncs
		///         Parameters:
		///             This_ClassListFuncs(Object &lt;- RedunicreDSI.WS.ClassListFuncs): Parameter added to hold the object instance to invoke
		///             codRet(Integer &lt;- int): Value used to set the Property
		/// </summary>
		/// <param name="ssThis_ClassListFuncs"></param>
		/// <param name="sscodRet"></param>
		public void MssClassListFuncsCodRetSet(object ssThis_ClassListFuncs, int sscodRet) {
			// Implementation for action
			((RedunicreDSI.WS.ClassListFuncs) ssThis_ClassListFuncs).codRet = sscodRet;
		} // MssClassListFuncsCodRetSet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassListFuncsCodRetGet:
		///         Target: Property codRet: int
		///         Declaring Type: RedunicreDSI.WS.ClassListFuncs
		///         Parameters:
		///             This_ClassListFuncs(Object &lt;- RedunicreDSI.WS.ClassListFuncs): Parameter added to hold the object instance to invoke
		///             codRet(Integer &lt;- int): Value of the Property
		/// </summary>
		/// <param name="ssThis_ClassListFuncs"></param>
		/// <param name="sscodRet"></param>
		public void MssClassListFuncsCodRetGet(object ssThis_ClassListFuncs, out int sscodRet) {
			sscodRet = 0;
			// Implementation for action
			sscodRet = ((RedunicreDSI.WS.ClassListFuncs) ssThis_ClassListFuncs).codRet;
		} // MssClassListFuncsCodRetGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassListFuncsFuncSet:
		///         Target: Property Func: RedunicreDSI.WS.ClassFunc[]
		///         Declaring Type: RedunicreDSI.WS.ClassListFuncs
		///         Parameters:
		///             This_ClassListFuncs(Object &lt;- RedunicreDSI.WS.ClassListFuncs): Parameter added to hold the object instance to invoke
		///             Func(Object &lt;- RedunicreDSI.WS.ClassFunc[]): Value used to set the Property
		/// </summary>
		/// <param name="ssThis_ClassListFuncs"></param>
		/// <param name="ssFunc"></param>
		public void MssClassListFuncsFuncSet(object ssThis_ClassListFuncs, object ssFunc) {
			// Implementation for action
			((RedunicreDSI.WS.ClassListFuncs) ssThis_ClassListFuncs).Func = (RedunicreDSI.WS.ClassFunc[]) ssFunc;
		} // MssClassListFuncsFuncSet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassListFuncsFuncGet:
		///         Target: Property Func: RedunicreDSI.WS.ClassFunc[]
		///         Declaring Type: RedunicreDSI.WS.ClassListFuncs
		///         Parameters:
		///             This_ClassListFuncs(Object &lt;- RedunicreDSI.WS.ClassListFuncs): Parameter added to hold the object instance to invoke
		///             Func(Object &lt;- RedunicreDSI.WS.ClassFunc[]): Value of the Property
		/// </summary>
		/// <param name="ssThis_ClassListFuncs"></param>
		/// <param name="ssFunc"></param>
		public void MssClassListFuncsFuncGet(object ssThis_ClassListFuncs, out object ssFunc) {
			ssFunc = null;
			// Implementation for action
			ssFunc = ((RedunicreDSI.WS.ClassListFuncs) ssThis_ClassListFuncs).Func;
		} // MssClassListFuncsFuncGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoContainerGet:
		///         Target: Property Container: System.ComponentModel.IContainer
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             Container(Object &lt;- System.ComponentModel.IContainer): Value of the Property
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssContainer"></param>
		public void MssGlobalInfoContainerGet(object ssThis_GlobalInfo, out object ssContainer) {
			ssContainer = null;
			// Implementation for action
			ssContainer = ((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).Container;
		} // MssGlobalInfoContainerGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoSiteSet:
		///         Target: Property Site: System.ComponentModel.ISite
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             Site(Object &lt;- System.ComponentModel.ISite): Value used to set the Property
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssSite"></param>
		public void MssGlobalInfoSiteSet(object ssThis_GlobalInfo, object ssSite) {
			// Implementation for action
			((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).Site = (System.ComponentModel.ISite) ssSite;
		} // MssGlobalInfoSiteSet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoSiteGet:
		///         Target: Property Site: System.ComponentModel.ISite
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             Site(Object &lt;- System.ComponentModel.ISite): Value of the Property
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssSite"></param>
		public void MssGlobalInfoSiteGet(object ssThis_GlobalInfo, out object ssSite) {
			ssSite = null;
			// Implementation for action
			ssSite = ((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).Site;
		} // MssGlobalInfoSiteGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoTimeoutSet:
		///         Target: Property Timeout: int
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             Timeout(Integer &lt;- int): Value used to set the Property
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssTimeout"></param>
		public void MssGlobalInfoTimeoutSet(object ssThis_GlobalInfo, int ssTimeout) {
			// Implementation for action
			((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).Timeout = ssTimeout;
		} // MssGlobalInfoTimeoutSet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoTimeoutGet:
		///         Target: Property Timeout: int
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             Timeout(Integer &lt;- int): Value of the Property
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssTimeout"></param>
		public void MssGlobalInfoTimeoutGet(object ssThis_GlobalInfo, out int ssTimeout) {
			ssTimeout = 0;
			// Implementation for action
			ssTimeout = ((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).Timeout;
		} // MssGlobalInfoTimeoutGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoRequestEncodingSet:
		///         Target: Property RequestEncoding: System.Text.Encoding
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             RequestEncoding(Object &lt;- System.Text.Encoding): Value used to set the Property
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssRequestEncoding"></param>
		public void MssGlobalInfoRequestEncodingSet(object ssThis_GlobalInfo, object ssRequestEncoding) {
			// Implementation for action
			((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).RequestEncoding = (System.Text.Encoding) ssRequestEncoding;
		} // MssGlobalInfoRequestEncodingSet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoRequestEncodingGet:
		///         Target: Property RequestEncoding: System.Text.Encoding
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             RequestEncoding(Object &lt;- System.Text.Encoding): Value of the Property
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssRequestEncoding"></param>
		public void MssGlobalInfoRequestEncodingGet(object ssThis_GlobalInfo, out object ssRequestEncoding) {
			ssRequestEncoding = null;
			// Implementation for action
			ssRequestEncoding = ((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).RequestEncoding;
		} // MssGlobalInfoRequestEncodingGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoUrlSet:
		///         Target: Property Url: string
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             Url(Text &lt;- string): Value used to set the Property
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssUrl"></param>
		public void MssGlobalInfoUrlSet(object ssThis_GlobalInfo, string ssUrl) {
			// Implementation for action
			((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).Url = ssUrl;
		} // MssGlobalInfoUrlSet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoUrlGet:
		///         Target: Property Url: string
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             Url(Text &lt;- string): Value of the Property
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssUrl"></param>
		public void MssGlobalInfoUrlGet(object ssThis_GlobalInfo, out string ssUrl) {
			ssUrl = string.Empty;
			// Implementation for action
			ssUrl = ((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).Url;
		} // MssGlobalInfoUrlGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoPreAuthenticateSet:
		///         Target: Property PreAuthenticate: bool
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             PreAuthenticate(Boolean &lt;- bool): Value used to set the Property
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssPreAuthenticate"></param>
		public void MssGlobalInfoPreAuthenticateSet(object ssThis_GlobalInfo, bool ssPreAuthenticate) {
			// Implementation for action
			((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).PreAuthenticate = ssPreAuthenticate;
		} // MssGlobalInfoPreAuthenticateSet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoPreAuthenticateGet:
		///         Target: Property PreAuthenticate: bool
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             PreAuthenticate(Boolean &lt;- bool): Value of the Property
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssPreAuthenticate"></param>
		public void MssGlobalInfoPreAuthenticateGet(object ssThis_GlobalInfo, out bool ssPreAuthenticate) {
			ssPreAuthenticate = false;
			// Implementation for action
			ssPreAuthenticate = ((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).PreAuthenticate;
		} // MssGlobalInfoPreAuthenticateGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoConnectionGroupNameSet:
		///         Target: Property ConnectionGroupName: string
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             ConnectionGroupName(Text &lt;- string): Value used to set the Property
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssConnectionGroupName"></param>
		public void MssGlobalInfoConnectionGroupNameSet(object ssThis_GlobalInfo, string ssConnectionGroupName) {
			// Implementation for action
			((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).ConnectionGroupName = ssConnectionGroupName;
		} // MssGlobalInfoConnectionGroupNameSet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoConnectionGroupNameGet:
		///         Target: Property ConnectionGroupName: string
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             ConnectionGroupName(Text &lt;- string): Value of the Property
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssConnectionGroupName"></param>
		public void MssGlobalInfoConnectionGroupNameGet(object ssThis_GlobalInfo, out string ssConnectionGroupName) {
			ssConnectionGroupName = string.Empty;
			// Implementation for action
			ssConnectionGroupName = ((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).ConnectionGroupName;
		} // MssGlobalInfoConnectionGroupNameGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoUseDefaultCredentialsSet:
		///         Target: Property UseDefaultCredentials: bool
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             UseDefaultCredentials(Boolean &lt;- bool): Value used to set the Property
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssUseDefaultCredentials"></param>
		public void MssGlobalInfoUseDefaultCredentialsSet(object ssThis_GlobalInfo, bool ssUseDefaultCredentials) {
			// Implementation for action
			((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).UseDefaultCredentials = ssUseDefaultCredentials;
		} // MssGlobalInfoUseDefaultCredentialsSet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoUseDefaultCredentialsGet:
		///         Target: Property UseDefaultCredentials: bool
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             UseDefaultCredentials(Boolean &lt;- bool): Value of the Property
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssUseDefaultCredentials"></param>
		public void MssGlobalInfoUseDefaultCredentialsGet(object ssThis_GlobalInfo, out bool ssUseDefaultCredentials) {
			ssUseDefaultCredentials = false;
			// Implementation for action
			ssUseDefaultCredentials = ((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).UseDefaultCredentials;
		} // MssGlobalInfoUseDefaultCredentialsGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoCredentialsSet:
		///         Target: Property Credentials: System.Net.ICredentials
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             Credentials(Object &lt;- System.Net.ICredentials): Value used to set the Property
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssCredentials"></param>
		public void MssGlobalInfoCredentialsSet(object ssThis_GlobalInfo, object ssCredentials) {
			// Implementation for action
			((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).Credentials = (System.Net.ICredentials) ssCredentials;
		} // MssGlobalInfoCredentialsSet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoCredentialsGet:
		///         Target: Property Credentials: System.Net.ICredentials
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             Credentials(Object &lt;- System.Net.ICredentials): Value of the Property
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssCredentials"></param>
		public void MssGlobalInfoCredentialsGet(object ssThis_GlobalInfo, out object ssCredentials) {
			ssCredentials = null;
			// Implementation for action
			ssCredentials = ((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).Credentials;
		} // MssGlobalInfoCredentialsGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoUnsafeAuthenticatedConnectionSharingSet:
		///         Target: Property UnsafeAuthenticatedConnectionSharing: bool
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             UnsafeAuthenticatedConnectionSharing(Boolean &lt;- bool): Value used to set the Property
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssUnsafeAuthenticatedConnectionSharing"></param>
		public void MssGlobalInfoUnsafeAuthenticatedConnectionSharingSet(object ssThis_GlobalInfo, bool ssUnsafeAuthenticatedConnectionSharing) {
			// Implementation for action
			((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).UnsafeAuthenticatedConnectionSharing = ssUnsafeAuthenticatedConnectionSharing;
		} // MssGlobalInfoUnsafeAuthenticatedConnectionSharingSet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoUnsafeAuthenticatedConnectionSharingGet:
		///         Target: Property UnsafeAuthenticatedConnectionSharing: bool
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             UnsafeAuthenticatedConnectionSharing(Boolean &lt;- bool): Value of the Property
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssUnsafeAuthenticatedConnectionSharing"></param>
		public void MssGlobalInfoUnsafeAuthenticatedConnectionSharingGet(object ssThis_GlobalInfo, out bool ssUnsafeAuthenticatedConnectionSharing) {
			ssUnsafeAuthenticatedConnectionSharing = false;
			// Implementation for action
			ssUnsafeAuthenticatedConnectionSharing = ((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).UnsafeAuthenticatedConnectionSharing;
		} // MssGlobalInfoUnsafeAuthenticatedConnectionSharingGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoProxySet:
		///         Target: Property Proxy: System.Net.IWebProxy
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             Proxy(Object &lt;- System.Net.IWebProxy): Value used to set the Property
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssProxy"></param>
		public void MssGlobalInfoProxySet(object ssThis_GlobalInfo, object ssProxy) {
			// Implementation for action
			((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).Proxy = (System.Net.IWebProxy) ssProxy;
		} // MssGlobalInfoProxySet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoProxyGet:
		///         Target: Property Proxy: System.Net.IWebProxy
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             Proxy(Object &lt;- System.Net.IWebProxy): Value of the Property
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssProxy"></param>
		public void MssGlobalInfoProxyGet(object ssThis_GlobalInfo, out object ssProxy) {
			ssProxy = null;
			// Implementation for action
			ssProxy = ((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).Proxy;
		} // MssGlobalInfoProxyGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoUserAgentSet:
		///         Target: Property UserAgent: string
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             UserAgent(Text &lt;- string): Value used to set the Property
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssUserAgent"></param>
		public void MssGlobalInfoUserAgentSet(object ssThis_GlobalInfo, string ssUserAgent) {
			// Implementation for action
			((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).UserAgent = ssUserAgent;
		} // MssGlobalInfoUserAgentSet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoUserAgentGet:
		///         Target: Property UserAgent: string
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             UserAgent(Text &lt;- string): Value of the Property
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssUserAgent"></param>
		public void MssGlobalInfoUserAgentGet(object ssThis_GlobalInfo, out string ssUserAgent) {
			ssUserAgent = string.Empty;
			// Implementation for action
			ssUserAgent = ((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).UserAgent;
		} // MssGlobalInfoUserAgentGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoEnableDecompressionSet:
		///         Target: Property EnableDecompression: bool
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             EnableDecompression(Boolean &lt;- bool): Value used to set the Property
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssEnableDecompression"></param>
		public void MssGlobalInfoEnableDecompressionSet(object ssThis_GlobalInfo, bool ssEnableDecompression) {
			// Implementation for action
			((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).EnableDecompression = ssEnableDecompression;
		} // MssGlobalInfoEnableDecompressionSet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoEnableDecompressionGet:
		///         Target: Property EnableDecompression: bool
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             EnableDecompression(Boolean &lt;- bool): Value of the Property
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssEnableDecompression"></param>
		public void MssGlobalInfoEnableDecompressionGet(object ssThis_GlobalInfo, out bool ssEnableDecompression) {
			ssEnableDecompression = false;
			// Implementation for action
			ssEnableDecompression = ((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).EnableDecompression;
		} // MssGlobalInfoEnableDecompressionGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoClientCertificatesGet:
		///         Target: Property ClientCertificates: System.Security.Cryptography.X509Certificates.X509CertificateCollection
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             ClientCertificates(Object &lt;- System.Security.Cryptography.X509Certificates.X509CertificateCollection): Value of the Property
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssClientCertificates"></param>
		public void MssGlobalInfoClientCertificatesGet(object ssThis_GlobalInfo, out object ssClientCertificates) {
			ssClientCertificates = null;
			// Implementation for action
			ssClientCertificates = ((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).ClientCertificates;
		} // MssGlobalInfoClientCertificatesGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoCookieContainerSet:
		///         Target: Property CookieContainer: System.Net.CookieContainer
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             CookieContainer(Object &lt;- System.Net.CookieContainer): Value used to set the Property
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssCookieContainer"></param>
		public void MssGlobalInfoCookieContainerSet(object ssThis_GlobalInfo, object ssCookieContainer) {
			// Implementation for action
			((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).CookieContainer = (System.Net.CookieContainer) ssCookieContainer;
		} // MssGlobalInfoCookieContainerSet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoCookieContainerGet:
		///         Target: Property CookieContainer: System.Net.CookieContainer
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             CookieContainer(Object &lt;- System.Net.CookieContainer): Value of the Property
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssCookieContainer"></param>
		public void MssGlobalInfoCookieContainerGet(object ssThis_GlobalInfo, out object ssCookieContainer) {
			ssCookieContainer = null;
			// Implementation for action
			ssCookieContainer = ((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).CookieContainer;
		} // MssGlobalInfoCookieContainerGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoAllowAutoRedirectSet:
		///         Target: Property AllowAutoRedirect: bool
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             AllowAutoRedirect(Boolean &lt;- bool): Value used to set the Property
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssAllowAutoRedirect"></param>
		public void MssGlobalInfoAllowAutoRedirectSet(object ssThis_GlobalInfo, bool ssAllowAutoRedirect) {
			// Implementation for action
			((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).AllowAutoRedirect = ssAllowAutoRedirect;
		} // MssGlobalInfoAllowAutoRedirectSet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoAllowAutoRedirectGet:
		///         Target: Property AllowAutoRedirect: bool
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             AllowAutoRedirect(Boolean &lt;- bool): Value of the Property
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssAllowAutoRedirect"></param>
		public void MssGlobalInfoAllowAutoRedirectGet(object ssThis_GlobalInfo, out bool ssAllowAutoRedirect) {
			ssAllowAutoRedirect = false;
			// Implementation for action
			ssAllowAutoRedirect = ((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).AllowAutoRedirect;
		} // MssGlobalInfoAllowAutoRedirectGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoSoapVersionSet:
		///         Target: Property SoapVersion: System.Web.Services.Protocols.SoapProtocolVersion
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             SoapVersion(Object &lt;- System.Web.Services.Protocols.SoapProtocolVersion): Value used to set the Property
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssSoapVersion"></param>
		public void MssGlobalInfoSoapVersionSet(object ssThis_GlobalInfo, object ssSoapVersion) {
			// Implementation for action
			((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).SoapVersion = (System.Web.Services.Protocols.SoapProtocolVersion) ssSoapVersion;
		} // MssGlobalInfoSoapVersionSet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoSoapVersionGet:
		///         Target: Property SoapVersion: System.Web.Services.Protocols.SoapProtocolVersion
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             SoapVersion(Object &lt;- System.Web.Services.Protocols.SoapProtocolVersion): Value of the Property
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssSoapVersion"></param>
		public void MssGlobalInfoSoapVersionGet(object ssThis_GlobalInfo, out object ssSoapVersion) {
			ssSoapVersion = null;
			// Implementation for action
			ssSoapVersion = ((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).SoapVersion;
		} // MssGlobalInfoSoapVersionGet

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ExecFuncCompletedEventArgsGetType:
		///         Target: Method GetType(): System.Type
		///         Declaring Type: RedunicreDSI.WS.ExecFuncCompletedEventArgs
		///         Parameters:
		///             This_ExecFuncCompletedEventArgs(Object &lt;- RedunicreDSI.WS.ExecFuncCompletedEventArgs): Parameter added to hold the object instance to invoke
		///             Return_Type(Object &lt;- System.Type): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_ExecFuncCompletedEventArgs"></param>
		/// <param name="ssReturn_Type"></param>
		public void MssExecFuncCompletedEventArgsGetType(object ssThis_ExecFuncCompletedEventArgs, out object ssReturn_Type) {
			ssReturn_Type = null;
			// Implementation for action
			ssReturn_Type = ((RedunicreDSI.WS.ExecFuncCompletedEventArgs) ssThis_ExecFuncCompletedEventArgs).GetType();
		} // MssExecFuncCompletedEventArgsGetType

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ExecFuncCompletedEventArgsGetHashCode:
		///         Target: Method GetHashCode(): int
		///         Declaring Type: RedunicreDSI.WS.ExecFuncCompletedEventArgs
		///         Parameters:
		///             This_ExecFuncCompletedEventArgs(Object &lt;- RedunicreDSI.WS.ExecFuncCompletedEventArgs): Parameter added to hold the object instance to invoke
		///             Return_Int32(Integer &lt;- int): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_ExecFuncCompletedEventArgs"></param>
		/// <param name="ssReturn_Int32"></param>
		public void MssExecFuncCompletedEventArgsGetHashCode(object ssThis_ExecFuncCompletedEventArgs, out int ssReturn_Int32) {
			ssReturn_Int32 = 0;
			// Implementation for action
			ssReturn_Int32 = ((RedunicreDSI.WS.ExecFuncCompletedEventArgs) ssThis_ExecFuncCompletedEventArgs).GetHashCode();
		} // MssExecFuncCompletedEventArgsGetHashCode

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ExecFuncCompletedEventArgsEquals:
		///         Target: Method Equals(object): bool
		///         Declaring Type: RedunicreDSI.WS.ExecFuncCompletedEventArgs
		///         Parameters:
		///             This_ExecFuncCompletedEventArgs(Object &lt;- RedunicreDSI.WS.ExecFuncCompletedEventArgs): Parameter added to hold the object instance to invoke
		///             obj(Object &lt;- object)
		///             Return_Boolean(Boolean &lt;- bool): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_ExecFuncCompletedEventArgs"></param>
		/// <param name="ssobj"></param>
		/// <param name="ssReturn_Boolean"></param>
		public void MssExecFuncCompletedEventArgsEquals(object ssThis_ExecFuncCompletedEventArgs, object ssobj, out bool ssReturn_Boolean) {
			ssReturn_Boolean = false;
			// Implementation for action
			ssReturn_Boolean = ((RedunicreDSI.WS.ExecFuncCompletedEventArgs) ssThis_ExecFuncCompletedEventArgs).Equals(ssobj);
		} // MssExecFuncCompletedEventArgsEquals

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ExecFuncCompletedEventArgsToString:
		///         Target: Method ToString(): string
		///         Declaring Type: RedunicreDSI.WS.ExecFuncCompletedEventArgs
		///         Parameters:
		///             This_ExecFuncCompletedEventArgs(Object &lt;- RedunicreDSI.WS.ExecFuncCompletedEventArgs): Parameter added to hold the object instance to invoke
		///             Return_String(Text &lt;- string): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_ExecFuncCompletedEventArgs"></param>
		/// <param name="ssReturn_String"></param>
		public void MssExecFuncCompletedEventArgsToString(object ssThis_ExecFuncCompletedEventArgs, out string ssReturn_String) {
			ssReturn_String = string.Empty;
			// Implementation for action
			ssReturn_String = ((RedunicreDSI.WS.ExecFuncCompletedEventArgs) ssThis_ExecFuncCompletedEventArgs).ToString();
		} // MssExecFuncCompletedEventArgsToString

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ListFuncsCompletedEventArgsGetType:
		///         Target: Method GetType(): System.Type
		///         Declaring Type: RedunicreDSI.WS.ListFuncsCompletedEventArgs
		///         Parameters:
		///             This_ListFuncsCompletedEventArgs(Object &lt;- RedunicreDSI.WS.ListFuncsCompletedEventArgs): Parameter added to hold the object instance to invoke
		///             Return_Type(Object &lt;- System.Type): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_ListFuncsCompletedEventArgs"></param>
		/// <param name="ssReturn_Type"></param>
		public void MssListFuncsCompletedEventArgsGetType(object ssThis_ListFuncsCompletedEventArgs, out object ssReturn_Type) {
			ssReturn_Type = null;
			// Implementation for action
			ssReturn_Type = ((RedunicreDSI.WS.ListFuncsCompletedEventArgs) ssThis_ListFuncsCompletedEventArgs).GetType();
		} // MssListFuncsCompletedEventArgsGetType

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ListFuncsCompletedEventArgsGetHashCode:
		///         Target: Method GetHashCode(): int
		///         Declaring Type: RedunicreDSI.WS.ListFuncsCompletedEventArgs
		///         Parameters:
		///             This_ListFuncsCompletedEventArgs(Object &lt;- RedunicreDSI.WS.ListFuncsCompletedEventArgs): Parameter added to hold the object instance to invoke
		///             Return_Int32(Integer &lt;- int): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_ListFuncsCompletedEventArgs"></param>
		/// <param name="ssReturn_Int32"></param>
		public void MssListFuncsCompletedEventArgsGetHashCode(object ssThis_ListFuncsCompletedEventArgs, out int ssReturn_Int32) {
			ssReturn_Int32 = 0;
			// Implementation for action
			ssReturn_Int32 = ((RedunicreDSI.WS.ListFuncsCompletedEventArgs) ssThis_ListFuncsCompletedEventArgs).GetHashCode();
		} // MssListFuncsCompletedEventArgsGetHashCode

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ListFuncsCompletedEventArgsEquals:
		///         Target: Method Equals(object): bool
		///         Declaring Type: RedunicreDSI.WS.ListFuncsCompletedEventArgs
		///         Parameters:
		///             This_ListFuncsCompletedEventArgs(Object &lt;- RedunicreDSI.WS.ListFuncsCompletedEventArgs): Parameter added to hold the object instance to invoke
		///             obj(Object &lt;- object)
		///             Return_Boolean(Boolean &lt;- bool): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_ListFuncsCompletedEventArgs"></param>
		/// <param name="ssobj"></param>
		/// <param name="ssReturn_Boolean"></param>
		public void MssListFuncsCompletedEventArgsEquals(object ssThis_ListFuncsCompletedEventArgs, object ssobj, out bool ssReturn_Boolean) {
			ssReturn_Boolean = false;
			// Implementation for action
			ssReturn_Boolean = ((RedunicreDSI.WS.ListFuncsCompletedEventArgs) ssThis_ListFuncsCompletedEventArgs).Equals(ssobj);
		} // MssListFuncsCompletedEventArgsEquals

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ListFuncsCompletedEventArgsToString:
		///         Target: Method ToString(): string
		///         Declaring Type: RedunicreDSI.WS.ListFuncsCompletedEventArgs
		///         Parameters:
		///             This_ListFuncsCompletedEventArgs(Object &lt;- RedunicreDSI.WS.ListFuncsCompletedEventArgs): Parameter added to hold the object instance to invoke
		///             Return_String(Text &lt;- string): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_ListFuncsCompletedEventArgs"></param>
		/// <param name="ssReturn_String"></param>
		public void MssListFuncsCompletedEventArgsToString(object ssThis_ListFuncsCompletedEventArgs, out string ssReturn_String) {
			ssReturn_String = string.Empty;
			// Implementation for action
			ssReturn_String = ((RedunicreDSI.WS.ListFuncsCompletedEventArgs) ssThis_ListFuncsCompletedEventArgs).ToString();
		} // MssListFuncsCompletedEventArgsToString

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassInfoGetType:
		///         Target: Method GetType(): System.Type
		///         Declaring Type: RedunicreDSI.WS.ClassInfo
		///         Parameters:
		///             This_ClassInfo(Object &lt;- RedunicreDSI.WS.ClassInfo): Parameter added to hold the object instance to invoke
		///             Return_Type(Object &lt;- System.Type): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_ClassInfo"></param>
		/// <param name="ssReturn_Type"></param>
		public void MssClassInfoGetType(object ssThis_ClassInfo, out object ssReturn_Type) {
			ssReturn_Type = null;
			// Implementation for action
			ssReturn_Type = ((RedunicreDSI.WS.ClassInfo) ssThis_ClassInfo).GetType();
		} // MssClassInfoGetType

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassInfoGetHashCode:
		///         Target: Method GetHashCode(): int
		///         Declaring Type: RedunicreDSI.WS.ClassInfo
		///         Parameters:
		///             This_ClassInfo(Object &lt;- RedunicreDSI.WS.ClassInfo): Parameter added to hold the object instance to invoke
		///             Return_Int32(Integer &lt;- int): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_ClassInfo"></param>
		/// <param name="ssReturn_Int32"></param>
		public void MssClassInfoGetHashCode(object ssThis_ClassInfo, out int ssReturn_Int32) {
			ssReturn_Int32 = 0;
			// Implementation for action
			ssReturn_Int32 = ((RedunicreDSI.WS.ClassInfo) ssThis_ClassInfo).GetHashCode();
		} // MssClassInfoGetHashCode

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassInfoEquals:
		///         Target: Method Equals(object): bool
		///         Declaring Type: RedunicreDSI.WS.ClassInfo
		///         Parameters:
		///             This_ClassInfo(Object &lt;- RedunicreDSI.WS.ClassInfo): Parameter added to hold the object instance to invoke
		///             obj(Object &lt;- object)
		///             Return_Boolean(Boolean &lt;- bool): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_ClassInfo"></param>
		/// <param name="ssobj"></param>
		/// <param name="ssReturn_Boolean"></param>
		public void MssClassInfoEquals(object ssThis_ClassInfo, object ssobj, out bool ssReturn_Boolean) {
			ssReturn_Boolean = false;
			// Implementation for action
			ssReturn_Boolean = ((RedunicreDSI.WS.ClassInfo) ssThis_ClassInfo).Equals(ssobj);
		} // MssClassInfoEquals

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassInfoToString:
		///         Target: Method ToString(): string
		///         Declaring Type: RedunicreDSI.WS.ClassInfo
		///         Parameters:
		///             This_ClassInfo(Object &lt;- RedunicreDSI.WS.ClassInfo): Parameter added to hold the object instance to invoke
		///             Return_String(Text &lt;- string): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_ClassInfo"></param>
		/// <param name="ssReturn_String"></param>
		public void MssClassInfoToString(object ssThis_ClassInfo, out string ssReturn_String) {
			ssReturn_String = string.Empty;
			// Implementation for action
			ssReturn_String = ((RedunicreDSI.WS.ClassInfo) ssThis_ClassInfo).ToString();
		} // MssClassInfoToString

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassGlobalInfoGetType:
		///         Target: Method GetType(): System.Type
		///         Declaring Type: RedunicreDSI.WS.ClassGlobalInfo
		///         Parameters:
		///             This_ClassGlobalInfo(Object &lt;- RedunicreDSI.WS.ClassGlobalInfo): Parameter added to hold the object instance to invoke
		///             Return_Type(Object &lt;- System.Type): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_ClassGlobalInfo"></param>
		/// <param name="ssReturn_Type"></param>
		public void MssClassGlobalInfoGetType(object ssThis_ClassGlobalInfo, out object ssReturn_Type) {
			ssReturn_Type = null;
			// Implementation for action
			ssReturn_Type = ((RedunicreDSI.WS.ClassGlobalInfo) ssThis_ClassGlobalInfo).GetType();
		} // MssClassGlobalInfoGetType

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassGlobalInfoGetHashCode:
		///         Target: Method GetHashCode(): int
		///         Declaring Type: RedunicreDSI.WS.ClassGlobalInfo
		///         Parameters:
		///             This_ClassGlobalInfo(Object &lt;- RedunicreDSI.WS.ClassGlobalInfo): Parameter added to hold the object instance to invoke
		///             Return_Int32(Integer &lt;- int): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_ClassGlobalInfo"></param>
		/// <param name="ssReturn_Int32"></param>
		public void MssClassGlobalInfoGetHashCode(object ssThis_ClassGlobalInfo, out int ssReturn_Int32) {
			ssReturn_Int32 = 0;
			// Implementation for action
			ssReturn_Int32 = ((RedunicreDSI.WS.ClassGlobalInfo) ssThis_ClassGlobalInfo).GetHashCode();
		} // MssClassGlobalInfoGetHashCode

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassGlobalInfoEquals:
		///         Target: Method Equals(object): bool
		///         Declaring Type: RedunicreDSI.WS.ClassGlobalInfo
		///         Parameters:
		///             This_ClassGlobalInfo(Object &lt;- RedunicreDSI.WS.ClassGlobalInfo): Parameter added to hold the object instance to invoke
		///             obj(Object &lt;- object)
		///             Return_Boolean(Boolean &lt;- bool): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_ClassGlobalInfo"></param>
		/// <param name="ssobj"></param>
		/// <param name="ssReturn_Boolean"></param>
		public void MssClassGlobalInfoEquals(object ssThis_ClassGlobalInfo, object ssobj, out bool ssReturn_Boolean) {
			ssReturn_Boolean = false;
			// Implementation for action
			ssReturn_Boolean = ((RedunicreDSI.WS.ClassGlobalInfo) ssThis_ClassGlobalInfo).Equals(ssobj);
		} // MssClassGlobalInfoEquals

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassGlobalInfoToString:
		///         Target: Method ToString(): string
		///         Declaring Type: RedunicreDSI.WS.ClassGlobalInfo
		///         Parameters:
		///             This_ClassGlobalInfo(Object &lt;- RedunicreDSI.WS.ClassGlobalInfo): Parameter added to hold the object instance to invoke
		///             Return_String(Text &lt;- string): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_ClassGlobalInfo"></param>
		/// <param name="ssReturn_String"></param>
		public void MssClassGlobalInfoToString(object ssThis_ClassGlobalInfo, out string ssReturn_String) {
			ssReturn_String = string.Empty;
			// Implementation for action
			ssReturn_String = ((RedunicreDSI.WS.ClassGlobalInfo) ssThis_ClassGlobalInfo).ToString();
		} // MssClassGlobalInfoToString

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassFuncGetType:
		///         Target: Method GetType(): System.Type
		///         Declaring Type: RedunicreDSI.WS.ClassFunc
		///         Parameters:
		///             This_ClassFunc(Object &lt;- RedunicreDSI.WS.ClassFunc): Parameter added to hold the object instance to invoke
		///             Return_Type(Object &lt;- System.Type): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_ClassFunc"></param>
		/// <param name="ssReturn_Type"></param>
		public void MssClassFuncGetType(object ssThis_ClassFunc, out object ssReturn_Type) {
			ssReturn_Type = null;
			// Implementation for action
			ssReturn_Type = ((RedunicreDSI.WS.ClassFunc) ssThis_ClassFunc).GetType();
		} // MssClassFuncGetType

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassFuncGetHashCode:
		///         Target: Method GetHashCode(): int
		///         Declaring Type: RedunicreDSI.WS.ClassFunc
		///         Parameters:
		///             This_ClassFunc(Object &lt;- RedunicreDSI.WS.ClassFunc): Parameter added to hold the object instance to invoke
		///             Return_Int32(Integer &lt;- int): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_ClassFunc"></param>
		/// <param name="ssReturn_Int32"></param>
		public void MssClassFuncGetHashCode(object ssThis_ClassFunc, out int ssReturn_Int32) {
			ssReturn_Int32 = 0;
			// Implementation for action
			ssReturn_Int32 = ((RedunicreDSI.WS.ClassFunc) ssThis_ClassFunc).GetHashCode();
		} // MssClassFuncGetHashCode

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassFuncEquals:
		///         Target: Method Equals(object): bool
		///         Declaring Type: RedunicreDSI.WS.ClassFunc
		///         Parameters:
		///             This_ClassFunc(Object &lt;- RedunicreDSI.WS.ClassFunc): Parameter added to hold the object instance to invoke
		///             obj(Object &lt;- object)
		///             Return_Boolean(Boolean &lt;- bool): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_ClassFunc"></param>
		/// <param name="ssobj"></param>
		/// <param name="ssReturn_Boolean"></param>
		public void MssClassFuncEquals(object ssThis_ClassFunc, object ssobj, out bool ssReturn_Boolean) {
			ssReturn_Boolean = false;
			// Implementation for action
			ssReturn_Boolean = ((RedunicreDSI.WS.ClassFunc) ssThis_ClassFunc).Equals(ssobj);
		} // MssClassFuncEquals

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassFuncToString:
		///         Target: Method ToString(): string
		///         Declaring Type: RedunicreDSI.WS.ClassFunc
		///         Parameters:
		///             This_ClassFunc(Object &lt;- RedunicreDSI.WS.ClassFunc): Parameter added to hold the object instance to invoke
		///             Return_String(Text &lt;- string): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_ClassFunc"></param>
		/// <param name="ssReturn_String"></param>
		public void MssClassFuncToString(object ssThis_ClassFunc, out string ssReturn_String) {
			ssReturn_String = string.Empty;
			// Implementation for action
			ssReturn_String = ((RedunicreDSI.WS.ClassFunc) ssThis_ClassFunc).ToString();
		} // MssClassFuncToString

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassListFuncsGetType:
		///         Target: Method GetType(): System.Type
		///         Declaring Type: RedunicreDSI.WS.ClassListFuncs
		///         Parameters:
		///             This_ClassListFuncs(Object &lt;- RedunicreDSI.WS.ClassListFuncs): Parameter added to hold the object instance to invoke
		///             Return_Type(Object &lt;- System.Type): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_ClassListFuncs"></param>
		/// <param name="ssReturn_Type"></param>
		public void MssClassListFuncsGetType(object ssThis_ClassListFuncs, out object ssReturn_Type) {
			ssReturn_Type = null;
			// Implementation for action
			ssReturn_Type = ((RedunicreDSI.WS.ClassListFuncs) ssThis_ClassListFuncs).GetType();
		} // MssClassListFuncsGetType

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassListFuncsGetHashCode:
		///         Target: Method GetHashCode(): int
		///         Declaring Type: RedunicreDSI.WS.ClassListFuncs
		///         Parameters:
		///             This_ClassListFuncs(Object &lt;- RedunicreDSI.WS.ClassListFuncs): Parameter added to hold the object instance to invoke
		///             Return_Int32(Integer &lt;- int): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_ClassListFuncs"></param>
		/// <param name="ssReturn_Int32"></param>
		public void MssClassListFuncsGetHashCode(object ssThis_ClassListFuncs, out int ssReturn_Int32) {
			ssReturn_Int32 = 0;
			// Implementation for action
			ssReturn_Int32 = ((RedunicreDSI.WS.ClassListFuncs) ssThis_ClassListFuncs).GetHashCode();
		} // MssClassListFuncsGetHashCode

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassListFuncsEquals:
		///         Target: Method Equals(object): bool
		///         Declaring Type: RedunicreDSI.WS.ClassListFuncs
		///         Parameters:
		///             This_ClassListFuncs(Object &lt;- RedunicreDSI.WS.ClassListFuncs): Parameter added to hold the object instance to invoke
		///             obj(Object &lt;- object)
		///             Return_Boolean(Boolean &lt;- bool): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_ClassListFuncs"></param>
		/// <param name="ssobj"></param>
		/// <param name="ssReturn_Boolean"></param>
		public void MssClassListFuncsEquals(object ssThis_ClassListFuncs, object ssobj, out bool ssReturn_Boolean) {
			ssReturn_Boolean = false;
			// Implementation for action
			ssReturn_Boolean = ((RedunicreDSI.WS.ClassListFuncs) ssThis_ClassListFuncs).Equals(ssobj);
		} // MssClassListFuncsEquals

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassListFuncsToString:
		///         Target: Method ToString(): string
		///         Declaring Type: RedunicreDSI.WS.ClassListFuncs
		///         Parameters:
		///             This_ClassListFuncs(Object &lt;- RedunicreDSI.WS.ClassListFuncs): Parameter added to hold the object instance to invoke
		///             Return_String(Text &lt;- string): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_ClassListFuncs"></param>
		/// <param name="ssReturn_String"></param>
		public void MssClassListFuncsToString(object ssThis_ClassListFuncs, out string ssReturn_String) {
			ssReturn_String = string.Empty;
			// Implementation for action
			ssReturn_String = ((RedunicreDSI.WS.ClassListFuncs) ssThis_ClassListFuncs).ToString();
		} // MssClassListFuncsToString

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoGetType:
		///         Target: Method GetType(): System.Type
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             Return_Type(Object &lt;- System.Type): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssReturn_Type"></param>
		public void MssGlobalInfoGetType(object ssThis_GlobalInfo, out object ssReturn_Type) {
			ssReturn_Type = null;
			// Implementation for action
			ssReturn_Type = ((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).GetType();
		} // MssGlobalInfoGetType

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoGetHashCode:
		///         Target: Method GetHashCode(): int
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             Return_Int32(Integer &lt;- int): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssReturn_Int32"></param>
		public void MssGlobalInfoGetHashCode(object ssThis_GlobalInfo, out int ssReturn_Int32) {
			ssReturn_Int32 = 0;
			// Implementation for action
			ssReturn_Int32 = ((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).GetHashCode();
		} // MssGlobalInfoGetHashCode

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoEquals:
		///         Target: Method Equals(object): bool
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             obj(Object &lt;- object)
		///             Return_Boolean(Boolean &lt;- bool): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssobj"></param>
		/// <param name="ssReturn_Boolean"></param>
		public void MssGlobalInfoEquals(object ssThis_GlobalInfo, object ssobj, out bool ssReturn_Boolean) {
			ssReturn_Boolean = false;
			// Implementation for action
			ssReturn_Boolean = ((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).Equals(ssobj);
		} // MssGlobalInfoEquals

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoCreateObjRef:
		///         Target: Method CreateObjRef(System.Type): System.Runtime.Remoting.ObjRef
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             requestedType(Object &lt;- System.Type)
		///             Return_ObjRef(Object &lt;- System.Runtime.Remoting.ObjRef): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssrequestedType"></param>
		/// <param name="ssReturn_ObjRef"></param>
		public void MssGlobalInfoCreateObjRef(object ssThis_GlobalInfo, object ssrequestedType, out object ssReturn_ObjRef) {
			ssReturn_ObjRef = null;
			// Implementation for action
			ssReturn_ObjRef = ((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).CreateObjRef((System.Type) ssrequestedType);
		} // MssGlobalInfoCreateObjRef

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoInitializeLifetimeService:
		///         Target: Method InitializeLifetimeService(): object
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             Return_Object(Object &lt;- object): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssReturn_Object"></param>
		public void MssGlobalInfoInitializeLifetimeService(object ssThis_GlobalInfo, out object ssReturn_Object) {
			ssReturn_Object = null;
			// Implementation for action
			ssReturn_Object = ((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).InitializeLifetimeService();
		} // MssGlobalInfoInitializeLifetimeService

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoGetLifetimeService:
		///         Target: Method GetLifetimeService(): object
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             Return_Object(Object &lt;- object): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssReturn_Object"></param>
		public void MssGlobalInfoGetLifetimeService(object ssThis_GlobalInfo, out object ssReturn_Object) {
			ssReturn_Object = null;
			// Implementation for action
			ssReturn_Object = ((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).GetLifetimeService();
		} // MssGlobalInfoGetLifetimeService

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoToString:
		///         Target: Method ToString(): string
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             Return_String(Text &lt;- string): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssReturn_String"></param>
		public void MssGlobalInfoToString(object ssThis_GlobalInfo, out string ssReturn_String) {
			ssReturn_String = string.Empty;
			// Implementation for action
			ssReturn_String = ((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).ToString();
		} // MssGlobalInfoToString

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoDispose:
		///         Target: Method Dispose()
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		public void MssGlobalInfoDispose(object ssThis_GlobalInfo) {
			// Implementation for action
			((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).Dispose();
		} // MssGlobalInfoDispose

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoAbort:
		///         Target: Method Abort()
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		public void MssGlobalInfoAbort(object ssThis_GlobalInfo) {
			// Implementation for action
			((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).Abort();
		} // MssGlobalInfoAbort

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoDiscover:
		///         Target: Method Discover()
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		public void MssGlobalInfoDiscover(object ssThis_GlobalInfo) {
			// Implementation for action
			((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).Discover();
		} // MssGlobalInfoDiscover

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoCancelAsync:
		///         Target: Method CancelAsync(object)
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             userState(Object &lt;- object)
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssuserState"></param>
		public void MssGlobalInfoCancelAsync(object ssThis_GlobalInfo, object ssuserState) {
			// Implementation for action
			((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).CancelAsync(ssuserState);
		} // MssGlobalInfoCancelAsync

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoExecFuncAsync1:
		///         Target: Method ExecFuncAsync(string, string, string, int, int, RedunicreDSI.WS.ClassInfo[], object)
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             sessId(Text &lt;- string)
		///             userName(Text &lt;- string)
		///             passwd(Text &lt;- string)
		///             funcId(Integer &lt;- int)
		///             actionId(Integer &lt;- int)
		///             info(Object &lt;- RedunicreDSI.WS.ClassInfo[])
		///             userState(Object &lt;- object)
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="sssessId"></param>
		/// <param name="ssuserName"></param>
		/// <param name="sspasswd"></param>
		/// <param name="ssfuncId"></param>
		/// <param name="ssactionId"></param>
		/// <param name="ssinfo"></param>
		/// <param name="ssuserState"></param>
		public void MssGlobalInfoExecFuncAsync1(object ssThis_GlobalInfo, string sssessId, string ssuserName, string sspasswd, int ssfuncId, int ssactionId, object ssinfo, object ssuserState) {
			// Implementation for action
			((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).ExecFuncAsync(sssessId, ssuserName, sspasswd, ssfuncId, ssactionId, (RedunicreDSI.WS.ClassInfo[]) ssinfo, ssuserState);
		} // MssGlobalInfoExecFuncAsync1

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoExecFuncAsync:
		///         Target: Method ExecFuncAsync(string, string, string, int, int, RedunicreDSI.WS.ClassInfo[])
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             sessId(Text &lt;- string)
		///             userName(Text &lt;- string)
		///             passwd(Text &lt;- string)
		///             funcId(Integer &lt;- int)
		///             actionId(Integer &lt;- int)
		///             info(Object &lt;- RedunicreDSI.WS.ClassInfo[])
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="sssessId"></param>
		/// <param name="ssuserName"></param>
		/// <param name="sspasswd"></param>
		/// <param name="ssfuncId"></param>
		/// <param name="ssactionId"></param>
		/// <param name="ssinfo"></param>
		public void MssGlobalInfoExecFuncAsync(object ssThis_GlobalInfo, string sssessId, string ssuserName, string sspasswd, int ssfuncId, int ssactionId, object ssinfo) {
			// Implementation for action
			((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).ExecFuncAsync(sssessId, ssuserName, sspasswd, ssfuncId, ssactionId, (RedunicreDSI.WS.ClassInfo[]) ssinfo);
		} // MssGlobalInfoExecFuncAsync

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoEndExecFunc:
		///         Target: Method EndExecFunc(System.IAsyncResult): RedunicreDSI.WS.ClassGlobalInfo
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             asyncResult(Object &lt;- System.IAsyncResult)
		///             Return_ClassGlobalInfo(Object &lt;- RedunicreDSI.WS.ClassGlobalInfo): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssasyncResult"></param>
		/// <param name="ssReturn_ClassGlobalInfo"></param>
		public void MssGlobalInfoEndExecFunc(object ssThis_GlobalInfo, object ssasyncResult, out object ssReturn_ClassGlobalInfo) {
			ssReturn_ClassGlobalInfo = null;
			// Implementation for action
			ssReturn_ClassGlobalInfo = ((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).EndExecFunc((System.IAsyncResult) ssasyncResult);
		} // MssGlobalInfoEndExecFunc

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoBeginExecFunc:
		///         Target: Method BeginExecFunc(string, string, string, int, int, RedunicreDSI.WS.ClassInfo[], System.AsyncCallback, object): System.IAsyncResult
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             sessId(Text &lt;- string)
		///             userName(Text &lt;- string)
		///             passwd(Text &lt;- string)
		///             funcId(Integer &lt;- int)
		///             actionId(Integer &lt;- int)
		///             info(Object &lt;- RedunicreDSI.WS.ClassInfo[])
		///             callback(Object &lt;- System.AsyncCallback)
		///             asyncState(Object &lt;- object)
		///             Return_IAsyncResult(Object &lt;- System.IAsyncResult): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="sssessId"></param>
		/// <param name="ssuserName"></param>
		/// <param name="sspasswd"></param>
		/// <param name="ssfuncId"></param>
		/// <param name="ssactionId"></param>
		/// <param name="ssinfo"></param>
		/// <param name="sscallback"></param>
		/// <param name="ssasyncState"></param>
		/// <param name="ssReturn_IAsyncResult"></param>
		public void MssGlobalInfoBeginExecFunc(object ssThis_GlobalInfo, string sssessId, string ssuserName, string sspasswd, int ssfuncId, int ssactionId, object ssinfo, object sscallback, object ssasyncState, out object ssReturn_IAsyncResult) {
			ssReturn_IAsyncResult = null;
			// Implementation for action
			ssReturn_IAsyncResult = ((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).BeginExecFunc(sssessId, ssuserName, sspasswd, ssfuncId, ssactionId, (RedunicreDSI.WS.ClassInfo[]) ssinfo, (System.AsyncCallback) sscallback, ssasyncState);
		} // MssGlobalInfoBeginExecFunc

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoExecFunc:
		///         Target: Method ExecFunc(string, string, string, int, int, RedunicreDSI.WS.ClassInfo[]): RedunicreDSI.WS.ClassGlobalInfo
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             sessId(Text &lt;- string)
		///             userName(Text &lt;- string)
		///             passwd(Text &lt;- string)
		///             funcId(Integer &lt;- int)
		///             actionId(Integer &lt;- int)
		///             info(Object &lt;- RedunicreDSI.WS.ClassInfo[])
		///             Return_ClassGlobalInfo(Object &lt;- RedunicreDSI.WS.ClassGlobalInfo): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="sssessId"></param>
		/// <param name="ssuserName"></param>
		/// <param name="sspasswd"></param>
		/// <param name="ssfuncId"></param>
		/// <param name="ssactionId"></param>
		/// <param name="ssinfo"></param>
		/// <param name="ssReturn_ClassGlobalInfo"></param>
		public void MssGlobalInfoExecFunc(object ssThis_GlobalInfo, string sssessId, string ssuserName, string sspasswd, int ssfuncId, int ssactionId, object ssinfo, out object ssReturn_ClassGlobalInfo) {
			ssReturn_ClassGlobalInfo = null;
			// Implementation for action
			ssReturn_ClassGlobalInfo = ((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).ExecFunc(sssessId, ssuserName, sspasswd, ssfuncId, ssactionId, (RedunicreDSI.WS.ClassInfo[]) ssinfo);
		} // MssGlobalInfoExecFunc

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoListFuncsAsync1:
		///         Target: Method ListFuncsAsync(string, string, string, object)
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             sessId(Text &lt;- string)
		///             userName(Text &lt;- string)
		///             passwd(Text &lt;- string)
		///             userState(Object &lt;- object)
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="sssessId"></param>
		/// <param name="ssuserName"></param>
		/// <param name="sspasswd"></param>
		/// <param name="ssuserState"></param>
		public void MssGlobalInfoListFuncsAsync1(object ssThis_GlobalInfo, string sssessId, string ssuserName, string sspasswd, object ssuserState) {
			// Implementation for action
			((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).ListFuncsAsync(sssessId, ssuserName, sspasswd, ssuserState);
		} // MssGlobalInfoListFuncsAsync1

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoListFuncsAsync:
		///         Target: Method ListFuncsAsync(string, string, string)
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             sessId(Text &lt;- string)
		///             userName(Text &lt;- string)
		///             passwd(Text &lt;- string)
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="sssessId"></param>
		/// <param name="ssuserName"></param>
		/// <param name="sspasswd"></param>
		public void MssGlobalInfoListFuncsAsync(object ssThis_GlobalInfo, string sssessId, string ssuserName, string sspasswd) {
			// Implementation for action
			((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).ListFuncsAsync(sssessId, ssuserName, sspasswd);
		} // MssGlobalInfoListFuncsAsync

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoEndListFuncs:
		///         Target: Method EndListFuncs(System.IAsyncResult): RedunicreDSI.WS.ClassListFuncs
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             asyncResult(Object &lt;- System.IAsyncResult)
		///             Return_ClassListFuncs(Object &lt;- RedunicreDSI.WS.ClassListFuncs): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="ssasyncResult"></param>
		/// <param name="ssReturn_ClassListFuncs"></param>
		public void MssGlobalInfoEndListFuncs(object ssThis_GlobalInfo, object ssasyncResult, out object ssReturn_ClassListFuncs) {
			ssReturn_ClassListFuncs = null;
			// Implementation for action
			ssReturn_ClassListFuncs = ((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).EndListFuncs((System.IAsyncResult) ssasyncResult);
		} // MssGlobalInfoEndListFuncs

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoBeginListFuncs:
		///         Target: Method BeginListFuncs(string, string, string, System.AsyncCallback, object): System.IAsyncResult
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             sessId(Text &lt;- string)
		///             userName(Text &lt;- string)
		///             passwd(Text &lt;- string)
		///             callback(Object &lt;- System.AsyncCallback)
		///             asyncState(Object &lt;- object)
		///             Return_IAsyncResult(Object &lt;- System.IAsyncResult): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="sssessId"></param>
		/// <param name="ssuserName"></param>
		/// <param name="sspasswd"></param>
		/// <param name="sscallback"></param>
		/// <param name="ssasyncState"></param>
		/// <param name="ssReturn_IAsyncResult"></param>
		public void MssGlobalInfoBeginListFuncs(object ssThis_GlobalInfo, string sssessId, string ssuserName, string sspasswd, object sscallback, object ssasyncState, out object ssReturn_IAsyncResult) {
			ssReturn_IAsyncResult = null;
			// Implementation for action
			ssReturn_IAsyncResult = ((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).BeginListFuncs(sssessId, ssuserName, sspasswd, (System.AsyncCallback) sscallback, ssasyncState);
		} // MssGlobalInfoBeginListFuncs

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoListFuncs:
		///         Target: Method ListFuncs(string, string, string): RedunicreDSI.WS.ClassListFuncs
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             This_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the object instance to invoke
		///             sessId(Text &lt;- string)
		///             userName(Text &lt;- string)
		///             passwd(Text &lt;- string)
		///             Return_ClassListFuncs(Object &lt;- RedunicreDSI.WS.ClassListFuncs): Parameter added to hold the method return
		/// </summary>
		/// <param name="ssThis_GlobalInfo"></param>
		/// <param name="sssessId"></param>
		/// <param name="ssuserName"></param>
		/// <param name="sspasswd"></param>
		/// <param name="ssReturn_ClassListFuncs"></param>
		public void MssGlobalInfoListFuncs(object ssThis_GlobalInfo, string sssessId, string ssuserName, string sspasswd, out object ssReturn_ClassListFuncs) {
			ssReturn_ClassListFuncs = null;
			// Implementation for action
			ssReturn_ClassListFuncs = ((RedunicreDSI.WS.GlobalInfo) ssThis_GlobalInfo).ListFuncs(sssessId, ssuserName, sspasswd);
		} // MssGlobalInfoListFuncs

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassInfoCreate:
		///         Target: Constructor ClassInfo(): RedunicreDSI.WS.ClassInfo
		///         Declaring Type: RedunicreDSI.WS.ClassInfo
		///         Parameters:
		///             New_ClassInfo(Object &lt;- RedunicreDSI.WS.ClassInfo): Parameter added to hold the new object instance
		/// </summary>
		/// <param name="ssNew_ClassInfo"></param>
		public void MssClassInfoCreate(out object ssNew_ClassInfo) {
			ssNew_ClassInfo = null;
			// Implementation for action
			ssNew_ClassInfo = new RedunicreDSI.WS.ClassInfo();
		} // MssClassInfoCreate

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassGlobalInfoCreate:
		///         Target: Constructor ClassGlobalInfo(): RedunicreDSI.WS.ClassGlobalInfo
		///         Declaring Type: RedunicreDSI.WS.ClassGlobalInfo
		///         Parameters:
		///             New_ClassGlobalInfo(Object &lt;- RedunicreDSI.WS.ClassGlobalInfo): Parameter added to hold the new object instance
		/// </summary>
		/// <param name="ssNew_ClassGlobalInfo"></param>
		public void MssClassGlobalInfoCreate(out object ssNew_ClassGlobalInfo) {
			ssNew_ClassGlobalInfo = null;
			// Implementation for action
			ssNew_ClassGlobalInfo = new RedunicreDSI.WS.ClassGlobalInfo();
		} // MssClassGlobalInfoCreate

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassFuncCreate:
		///         Target: Constructor ClassFunc(): RedunicreDSI.WS.ClassFunc
		///         Declaring Type: RedunicreDSI.WS.ClassFunc
		///         Parameters:
		///             New_ClassFunc(Object &lt;- RedunicreDSI.WS.ClassFunc): Parameter added to hold the new object instance
		/// </summary>
		/// <param name="ssNew_ClassFunc"></param>
		public void MssClassFuncCreate(out object ssNew_ClassFunc) {
			ssNew_ClassFunc = null;
			// Implementation for action
			ssNew_ClassFunc = new RedunicreDSI.WS.ClassFunc();
		} // MssClassFuncCreate

		/// <summary>
		/// Import Details:
		/// 
		///  - Action ClassListFuncsCreate:
		///         Target: Constructor ClassListFuncs(): RedunicreDSI.WS.ClassListFuncs
		///         Declaring Type: RedunicreDSI.WS.ClassListFuncs
		///         Parameters:
		///             New_ClassListFuncs(Object &lt;- RedunicreDSI.WS.ClassListFuncs): Parameter added to hold the new object instance
		/// </summary>
		/// <param name="ssNew_ClassListFuncs"></param>
		public void MssClassListFuncsCreate(out object ssNew_ClassListFuncs) {
			ssNew_ClassListFuncs = null;
			// Implementation for action
			ssNew_ClassListFuncs = new RedunicreDSI.WS.ClassListFuncs();
		} // MssClassListFuncsCreate

		/// <summary>
		/// Import Details:
		/// 
		///  - Action GlobalInfoCreate:
		///         Target: Constructor GlobalInfo(): RedunicreDSI.WS.GlobalInfo
		///         Declaring Type: RedunicreDSI.WS.GlobalInfo
		///         Parameters:
		///             New_GlobalInfo(Object &lt;- RedunicreDSI.WS.GlobalInfo): Parameter added to hold the new object instance
		/// </summary>
		/// <param name="ssNew_GlobalInfo"></param>
		public void MssGlobalInfoCreate(out object ssNew_GlobalInfo) {
			ssNew_GlobalInfo = null;
			// Implementation for action
			ssNew_GlobalInfo = new RedunicreDSI.WS.GlobalInfo();
		} // MssGlobalInfoCreate

	} // CssRedunicreDSI_WS

} // OutSystems.NssRedunicreDSI_WS

