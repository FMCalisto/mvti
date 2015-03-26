using System;
using System.Collections;
using System.Data;
using OutSystems.HubEdition.RuntimePlatform;
using GotDotNet.ApplicationBlocks;

namespace OutSystems.NssRedunicreDSI_WS {

	public interface IssRedunicreDSI_WS {

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
		void MssGlobalInfoCreate(out object ssNew_GlobalInfo);

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
		void MssClassListFuncsCreate(out object ssNew_ClassListFuncs);

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
		void MssClassFuncCreate(out object ssNew_ClassFunc);

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
		void MssClassGlobalInfoCreate(out object ssNew_ClassGlobalInfo);

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
		void MssClassInfoCreate(out object ssNew_ClassInfo);

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
		void MssGlobalInfoListFuncs(object ssThis_GlobalInfo, string sssessId, string ssuserName, string sspasswd, out object ssReturn_ClassListFuncs);

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
		void MssGlobalInfoBeginListFuncs(object ssThis_GlobalInfo, string sssessId, string ssuserName, string sspasswd, object sscallback, object ssasyncState, out object ssReturn_IAsyncResult);

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
		void MssGlobalInfoEndListFuncs(object ssThis_GlobalInfo, object ssasyncResult, out object ssReturn_ClassListFuncs);

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
		void MssGlobalInfoListFuncsAsync(object ssThis_GlobalInfo, string sssessId, string ssuserName, string sspasswd);

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
		void MssGlobalInfoListFuncsAsync1(object ssThis_GlobalInfo, string sssessId, string ssuserName, string sspasswd, object ssuserState);

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
		void MssGlobalInfoExecFunc(object ssThis_GlobalInfo, string sssessId, string ssuserName, string sspasswd, int ssfuncId, int ssactionId, object ssinfo, out object ssReturn_ClassGlobalInfo);

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
		void MssGlobalInfoBeginExecFunc(object ssThis_GlobalInfo, string sssessId, string ssuserName, string sspasswd, int ssfuncId, int ssactionId, object ssinfo, object sscallback, object ssasyncState, out object ssReturn_IAsyncResult);

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
		void MssGlobalInfoEndExecFunc(object ssThis_GlobalInfo, object ssasyncResult, out object ssReturn_ClassGlobalInfo);

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
		void MssGlobalInfoExecFuncAsync(object ssThis_GlobalInfo, string sssessId, string ssuserName, string sspasswd, int ssfuncId, int ssactionId, object ssinfo);

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
		void MssGlobalInfoExecFuncAsync1(object ssThis_GlobalInfo, string sssessId, string ssuserName, string sspasswd, int ssfuncId, int ssactionId, object ssinfo, object ssuserState);

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
		void MssGlobalInfoCancelAsync(object ssThis_GlobalInfo, object ssuserState);

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
		void MssGlobalInfoDiscover(object ssThis_GlobalInfo);

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
		void MssGlobalInfoAbort(object ssThis_GlobalInfo);

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
		void MssGlobalInfoDispose(object ssThis_GlobalInfo);

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
		void MssGlobalInfoToString(object ssThis_GlobalInfo, out string ssReturn_String);

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
		void MssGlobalInfoGetLifetimeService(object ssThis_GlobalInfo, out object ssReturn_Object);

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
		void MssGlobalInfoInitializeLifetimeService(object ssThis_GlobalInfo, out object ssReturn_Object);

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
		void MssGlobalInfoCreateObjRef(object ssThis_GlobalInfo, object ssrequestedType, out object ssReturn_ObjRef);

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
		void MssGlobalInfoEquals(object ssThis_GlobalInfo, object ssobj, out bool ssReturn_Boolean);

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
		void MssGlobalInfoGetHashCode(object ssThis_GlobalInfo, out int ssReturn_Int32);

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
		void MssGlobalInfoGetType(object ssThis_GlobalInfo, out object ssReturn_Type);

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
		void MssClassListFuncsToString(object ssThis_ClassListFuncs, out string ssReturn_String);

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
		void MssClassListFuncsEquals(object ssThis_ClassListFuncs, object ssobj, out bool ssReturn_Boolean);

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
		void MssClassListFuncsGetHashCode(object ssThis_ClassListFuncs, out int ssReturn_Int32);

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
		void MssClassListFuncsGetType(object ssThis_ClassListFuncs, out object ssReturn_Type);

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
		void MssClassFuncToString(object ssThis_ClassFunc, out string ssReturn_String);

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
		void MssClassFuncEquals(object ssThis_ClassFunc, object ssobj, out bool ssReturn_Boolean);

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
		void MssClassFuncGetHashCode(object ssThis_ClassFunc, out int ssReturn_Int32);

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
		void MssClassFuncGetType(object ssThis_ClassFunc, out object ssReturn_Type);

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
		void MssClassGlobalInfoToString(object ssThis_ClassGlobalInfo, out string ssReturn_String);

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
		void MssClassGlobalInfoEquals(object ssThis_ClassGlobalInfo, object ssobj, out bool ssReturn_Boolean);

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
		void MssClassGlobalInfoGetHashCode(object ssThis_ClassGlobalInfo, out int ssReturn_Int32);

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
		void MssClassGlobalInfoGetType(object ssThis_ClassGlobalInfo, out object ssReturn_Type);

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
		void MssClassInfoToString(object ssThis_ClassInfo, out string ssReturn_String);

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
		void MssClassInfoEquals(object ssThis_ClassInfo, object ssobj, out bool ssReturn_Boolean);

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
		void MssClassInfoGetHashCode(object ssThis_ClassInfo, out int ssReturn_Int32);

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
		void MssClassInfoGetType(object ssThis_ClassInfo, out object ssReturn_Type);

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
		void MssListFuncsCompletedEventArgsToString(object ssThis_ListFuncsCompletedEventArgs, out string ssReturn_String);

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
		void MssListFuncsCompletedEventArgsEquals(object ssThis_ListFuncsCompletedEventArgs, object ssobj, out bool ssReturn_Boolean);

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
		void MssListFuncsCompletedEventArgsGetHashCode(object ssThis_ListFuncsCompletedEventArgs, out int ssReturn_Int32);

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
		void MssListFuncsCompletedEventArgsGetType(object ssThis_ListFuncsCompletedEventArgs, out object ssReturn_Type);

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
		void MssExecFuncCompletedEventArgsToString(object ssThis_ExecFuncCompletedEventArgs, out string ssReturn_String);

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
		void MssExecFuncCompletedEventArgsEquals(object ssThis_ExecFuncCompletedEventArgs, object ssobj, out bool ssReturn_Boolean);

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
		void MssExecFuncCompletedEventArgsGetHashCode(object ssThis_ExecFuncCompletedEventArgs, out int ssReturn_Int32);

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
		void MssExecFuncCompletedEventArgsGetType(object ssThis_ExecFuncCompletedEventArgs, out object ssReturn_Type);

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
		void MssGlobalInfoSoapVersionGet(object ssThis_GlobalInfo, out object ssSoapVersion);

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
		void MssGlobalInfoSoapVersionSet(object ssThis_GlobalInfo, object ssSoapVersion);

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
		void MssGlobalInfoAllowAutoRedirectGet(object ssThis_GlobalInfo, out bool ssAllowAutoRedirect);

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
		void MssGlobalInfoAllowAutoRedirectSet(object ssThis_GlobalInfo, bool ssAllowAutoRedirect);

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
		void MssGlobalInfoCookieContainerGet(object ssThis_GlobalInfo, out object ssCookieContainer);

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
		void MssGlobalInfoCookieContainerSet(object ssThis_GlobalInfo, object ssCookieContainer);

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
		void MssGlobalInfoClientCertificatesGet(object ssThis_GlobalInfo, out object ssClientCertificates);

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
		void MssGlobalInfoEnableDecompressionGet(object ssThis_GlobalInfo, out bool ssEnableDecompression);

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
		void MssGlobalInfoEnableDecompressionSet(object ssThis_GlobalInfo, bool ssEnableDecompression);

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
		void MssGlobalInfoUserAgentGet(object ssThis_GlobalInfo, out string ssUserAgent);

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
		void MssGlobalInfoUserAgentSet(object ssThis_GlobalInfo, string ssUserAgent);

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
		void MssGlobalInfoProxyGet(object ssThis_GlobalInfo, out object ssProxy);

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
		void MssGlobalInfoProxySet(object ssThis_GlobalInfo, object ssProxy);

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
		void MssGlobalInfoUnsafeAuthenticatedConnectionSharingGet(object ssThis_GlobalInfo, out bool ssUnsafeAuthenticatedConnectionSharing);

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
		void MssGlobalInfoUnsafeAuthenticatedConnectionSharingSet(object ssThis_GlobalInfo, bool ssUnsafeAuthenticatedConnectionSharing);

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
		void MssGlobalInfoCredentialsGet(object ssThis_GlobalInfo, out object ssCredentials);

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
		void MssGlobalInfoCredentialsSet(object ssThis_GlobalInfo, object ssCredentials);

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
		void MssGlobalInfoUseDefaultCredentialsGet(object ssThis_GlobalInfo, out bool ssUseDefaultCredentials);

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
		void MssGlobalInfoUseDefaultCredentialsSet(object ssThis_GlobalInfo, bool ssUseDefaultCredentials);

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
		void MssGlobalInfoConnectionGroupNameGet(object ssThis_GlobalInfo, out string ssConnectionGroupName);

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
		void MssGlobalInfoConnectionGroupNameSet(object ssThis_GlobalInfo, string ssConnectionGroupName);

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
		void MssGlobalInfoPreAuthenticateGet(object ssThis_GlobalInfo, out bool ssPreAuthenticate);

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
		void MssGlobalInfoPreAuthenticateSet(object ssThis_GlobalInfo, bool ssPreAuthenticate);

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
		void MssGlobalInfoUrlGet(object ssThis_GlobalInfo, out string ssUrl);

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
		void MssGlobalInfoUrlSet(object ssThis_GlobalInfo, string ssUrl);

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
		void MssGlobalInfoRequestEncodingGet(object ssThis_GlobalInfo, out object ssRequestEncoding);

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
		void MssGlobalInfoRequestEncodingSet(object ssThis_GlobalInfo, object ssRequestEncoding);

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
		void MssGlobalInfoTimeoutGet(object ssThis_GlobalInfo, out int ssTimeout);

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
		void MssGlobalInfoTimeoutSet(object ssThis_GlobalInfo, int ssTimeout);

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
		void MssGlobalInfoSiteGet(object ssThis_GlobalInfo, out object ssSite);

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
		void MssGlobalInfoSiteSet(object ssThis_GlobalInfo, object ssSite);

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
		void MssGlobalInfoContainerGet(object ssThis_GlobalInfo, out object ssContainer);

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
		void MssClassListFuncsFuncGet(object ssThis_ClassListFuncs, out object ssFunc);

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
		void MssClassListFuncsFuncSet(object ssThis_ClassListFuncs, object ssFunc);

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
		void MssClassListFuncsCodRetGet(object ssThis_ClassListFuncs, out int sscodRet);

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
		void MssClassListFuncsCodRetSet(object ssThis_ClassListFuncs, int sscodRet);

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
		void MssClassFuncEstabelecimentoGet(object ssThis_ClassFunc, out string ssEstabelecimento);

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
		void MssClassFuncEstabelecimentoSet(object ssThis_ClassFunc, string ssEstabelecimento);

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
		void MssClassFuncFuncionalidade_IdGet(object ssThis_ClassFunc, out int ssFuncionalidade_Id);

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
		void MssClassFuncFuncionalidade_IdSet(object ssThis_ClassFunc, int ssFuncionalidade_Id);

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
		void MssClassFuncDescricaoGet(object ssThis_ClassFunc, out string ssDescricao);

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
		void MssClassFuncDescricaoSet(object ssThis_ClassFunc, string ssDescricao);

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
		void MssClassGlobalInfoInfoGet(object ssThis_ClassGlobalInfo, out object ssinfo);

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
		void MssClassGlobalInfoInfoSet(object ssThis_ClassGlobalInfo, object ssinfo);

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
		void MssClassGlobalInfoCodRetGet(object ssThis_ClassGlobalInfo, out int sscodRet);

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
		void MssClassGlobalInfoCodRetSet(object ssThis_ClassGlobalInfo, int sscodRet);

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
		void MssClassInfoKeyGet(object ssThis_ClassInfo, out string sskey);

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
		void MssClassInfoKeySet(object ssThis_ClassInfo, string sskey);

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
		void MssClassInfoValueGet(object ssThis_ClassInfo, out string ssvalue);

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
		void MssClassInfoValueSet(object ssThis_ClassInfo, string ssvalue);

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
		void MssListFuncsCompletedEventArgsResultGet(object ssThis_ListFuncsCompletedEventArgs, out object ssResult);

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
		void MssListFuncsCompletedEventArgsCancelledGet(object ssThis_ListFuncsCompletedEventArgs, out bool ssCancelled);

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
		void MssListFuncsCompletedEventArgsErrorGet(object ssThis_ListFuncsCompletedEventArgs, out object ssError);

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
		void MssListFuncsCompletedEventArgsUserStateGet(object ssThis_ListFuncsCompletedEventArgs, out object ssUserState);

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
		void MssExecFuncCompletedEventArgsResultGet(object ssThis_ExecFuncCompletedEventArgs, out object ssResult);

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
		void MssExecFuncCompletedEventArgsCancelledGet(object ssThis_ExecFuncCompletedEventArgs, out bool ssCancelled);

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
		void MssExecFuncCompletedEventArgsErrorGet(object ssThis_ExecFuncCompletedEventArgs, out object ssError);

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
		void MssExecFuncCompletedEventArgsUserStateGet(object ssThis_ExecFuncCompletedEventArgs, out object ssUserState);

	} // IssRedunicreDSI_WS

} // OutSystems.NssRedunicreDSI_WS
