Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC32559D
	for <mhi@lists.linux.dev>; Mon, 28 Feb 2022 14:00:13 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-170-IkmGZggGOcSuzsrYVp04QA-1; Mon, 28 Feb 2022 14:00:10 +0000
X-MC-Unique: IkmGZggGOcSuzsrYVp04QA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Mon, 28 Feb 2022 14:00:07 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Mon, 28 Feb 2022 14:00:07 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Manivannan Sadhasivam' <manivannan.sadhasivam@linaro.org>,
	"mhi@lists.linux.dev" <mhi@lists.linux.dev>
CC: "quic_hemantk@quicinc.com" <quic_hemantk@quicinc.com>,
	"quic_bbhatt@quicinc.com" <quic_bbhatt@quicinc.com>, "quic_jhugo@quicinc.com"
	<quic_jhugo@quicinc.com>, "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
	"bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
	"quic_vbadigan@quicinc.com" <quic_vbadigan@quicinc.com>,
	"quic_cang@quicinc.com" <quic_cang@quicinc.com>, "quic_skananth@quicinc.com"
	<quic_skananth@quicinc.com>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "elder@linaro.org" <elder@linaro.org>
Subject: RE: [PATCH v4 05/27] bus: mhi: Use bitfield operations for handling
 DWORDs of ring elements
Thread-Topic: [PATCH v4 05/27] bus: mhi: Use bitfield operations for handling
 DWORDs of ring elements
Thread-Index: AQHYLKD5KBrT0mkrcEuEmuVBLjzK3Kyo+w/g
Date: Mon, 28 Feb 2022 14:00:07 +0000
Message-ID: <90b1d3954b8c4157a4045db82b562271@AcuMS.aculab.com>
References: <20220228124344.77359-1-manivannan.sadhasivam@linaro.org>
 <20220228124344.77359-6-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20220228124344.77359-6-manivannan.sadhasivam@linaro.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Manivannan Sadhasivam
> Sent: 28 February 2022 12:43
>=20
> Instead of using the hardcoded bits in DWORD definitions, let's use the
> bitfield operations to make it more clear how the DWORDs are structured.

That all makes it as clear as mud.
Try reading it!

=09David

>=20
> Suggested-by: Alex Elder <elder@linaro.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/bus/mhi/host/internal.h | 58 +++++++++++++++++++--------------
>  1 file changed, 33 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/inter=
nal.h
> index 156bf65b6810..1d1790e83a93 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -7,6 +7,7 @@
>  #ifndef _MHI_INT_H
>  #define _MHI_INT_H
>=20
> +#include <linux/bitfield.h>
>  #include <linux/mhi.h>
>=20
>  extern struct bus_type mhi_bus_type;
> @@ -205,58 +206,65 @@ enum mhi_cmd_type {
>  /* No operation command */
>  #define MHI_TRE_CMD_NOOP_PTR (0)
>  #define MHI_TRE_CMD_NOOP_DWORD0 (0)
> -#define MHI_TRE_CMD_NOOP_DWORD1 (cpu_to_le32(MHI_CMD_NOP << 16))
> +#define MHI_TRE_CMD_NOOP_DWORD1 (cpu_to_le32(FIELD_PREP(GENMASK(23, 16),=
 MHI_CMD_NOP)))
>=20
>  /* Channel reset command */
>  #define MHI_TRE_CMD_RESET_PTR (0)
>  #define MHI_TRE_CMD_RESET_DWORD0 (0)
> -#define MHI_TRE_CMD_RESET_DWORD1(chid) (cpu_to_le32((chid << 24) | \
> -=09=09=09=09=09(MHI_CMD_RESET_CHAN << 16)))
> +#define MHI_TRE_CMD_RESET_DWORD1(chid) (cpu_to_le32(FIELD_PREP(GENMASK(3=
1, 24), chid)) | \
> +=09=09=09=09=09FIELD_PREP(GENMASK(23, 16), MHI_CMD_RESET_CHAN))
>=20
>  /* Channel stop command */
>  #define MHI_TRE_CMD_STOP_PTR (0)
>  #define MHI_TRE_CMD_STOP_DWORD0 (0)
> -#define MHI_TRE_CMD_STOP_DWORD1(chid) (cpu_to_le32((chid << 24) | \
> -=09=09=09=09       (MHI_CMD_STOP_CHAN << 16)))
> +#define MHI_TRE_CMD_STOP_DWORD1(chid) (cpu_to_le32(FIELD_PREP(GENMASK(31=
, 24), chid)) | \
> +=09=09=09=09=09FIELD_PREP(GENMASK(23, 16), MHI_CMD_STOP_CHAN))
>=20
>  /* Channel start command */
>  #define MHI_TRE_CMD_START_PTR (0)
>  #define MHI_TRE_CMD_START_DWORD0 (0)
> -#define MHI_TRE_CMD_START_DWORD1(chid) (cpu_to_le32((chid << 24) | \
> -=09=09=09=09=09(MHI_CMD_START_CHAN << 16)))
> +#define MHI_TRE_CMD_START_DWORD1(chid) (cpu_to_le32(FIELD_PREP(GENMASK(3=
1, 24), chid)) | \
> +=09=09=09=09=09FIELD_PREP(GENMASK(23, 16), MHI_CMD_START_CHAN))
>=20
>  #define MHI_TRE_GET_DWORD(tre, word) (le32_to_cpu((tre)->dword[(word)]))
> -#define MHI_TRE_GET_CMD_CHID(tre) ((MHI_TRE_GET_DWORD(tre, 1) >> 24) & 0=
xFF)
> -#define MHI_TRE_GET_CMD_TYPE(tre) ((MHI_TRE_GET_DWORD(tre, 1) >> 16) & 0=
xFF)
> +#define MHI_TRE_GET_CMD_CHID(tre) (FIELD_GET(GENMASK(31, 24), (MHI_TRE_G=
ET_DWORD(tre, 1))))
> +#define MHI_TRE_GET_CMD_TYPE(tre) (FIELD_GET(GENMASK(23, 16), (MHI_TRE_G=
ET_DWORD(tre, 1))))
>=20
>  /* Event descriptor macros */
>  #define MHI_TRE_EV_PTR(ptr) (cpu_to_le64(ptr))
> -#define MHI_TRE_EV_DWORD0(code, len) (cpu_to_le32((code << 24) | len))
> -#define MHI_TRE_EV_DWORD1(chid, type) (cpu_to_le32((chid << 24) | (type =
<< 16)))
> +#define MHI_TRE_EV_DWORD0(code, len) (cpu_to_le32(FIELD_PREP(GENMASK(31,=
 24), code) | \
> +=09=09=09=09=09=09FIELD_PREP(GENMASK(15, 0), len)))
> +#define MHI_TRE_EV_DWORD1(chid, type) (cpu_to_le32(FIELD_PREP(GENMASK(31=
, 24), chid) | \
> +=09=09=09=09=09=09FIELD_PREP(GENMASK(23, 16), type)))
>  #define MHI_TRE_GET_EV_PTR(tre) (le64_to_cpu((tre)->ptr))
> -#define MHI_TRE_GET_EV_CODE(tre) ((MHI_TRE_GET_DWORD(tre, 0) >> 24) & 0x=
FF)
> -#define MHI_TRE_GET_EV_LEN(tre) (MHI_TRE_GET_DWORD(tre, 0) & 0xFFFF)
> -#define MHI_TRE_GET_EV_CHID(tre) ((MHI_TRE_GET_DWORD(tre, 1) >> 24) & 0x=
FF)
> -#define MHI_TRE_GET_EV_TYPE(tre) ((MHI_TRE_GET_DWORD(tre, 1) >> 16) & 0x=
FF)
> -#define MHI_TRE_GET_EV_STATE(tre) ((MHI_TRE_GET_DWORD(tre, 0) >> 24) & 0=
xFF)
> -#define MHI_TRE_GET_EV_EXECENV(tre) ((MHI_TRE_GET_DWORD(tre, 0) >> 24) &=
 0xFF)
> +#define MHI_TRE_GET_EV_CODE(tre) (FIELD_GET(GENMASK(31, 24), (MHI_TRE_GE=
T_DWORD(tre, 0))))
> +#define MHI_TRE_GET_EV_LEN(tre) (FIELD_GET(GENMASK(15, 0), (MHI_TRE_GET_=
DWORD(tre, 0))))
> +#define MHI_TRE_GET_EV_CHID(tre) (FIELD_GET(GENMASK(31, 24), (MHI_TRE_GE=
T_DWORD(tre, 1))))
> +#define MHI_TRE_GET_EV_TYPE(tre) (FIELD_GET(GENMASK(23, 16), (MHI_TRE_GE=
T_DWORD(tre, 1))))
> +#define MHI_TRE_GET_EV_STATE(tre) (FIELD_GET(GENMASK(31, 24), (MHI_TRE_G=
ET_DWORD(tre, 0))))
> +#define MHI_TRE_GET_EV_EXECENV(tre) (FIELD_GET(GENMASK(31, 24), (MHI_TRE=
_GET_DWORD(tre, 0))))
>  #define MHI_TRE_GET_EV_SEQ(tre) MHI_TRE_GET_DWORD(tre, 0)
>  #define MHI_TRE_GET_EV_TIME(tre) (MHI_TRE_GET_EV_PTR(tre))
>  #define MHI_TRE_GET_EV_COOKIE(tre) lower_32_bits(MHI_TRE_GET_EV_PTR(tre)=
)
> -#define MHI_TRE_GET_EV_VEID(tre) ((MHI_TRE_GET_DWORD(tre, 0) >> 16) & 0x=
FF)
> -#define MHI_TRE_GET_EV_LINKSPEED(tre) ((MHI_TRE_GET_DWORD(tre, 1) >> 24)=
 & 0xFF)
> -#define MHI_TRE_GET_EV_LINKWIDTH(tre) (MHI_TRE_GET_DWORD(tre, 0) & 0xFF)
> +#define MHI_TRE_GET_EV_VEID(tre) (FIELD_GET(GENMASK(23, 16), (MHI_TRE_GE=
T_DWORD(tre, 0))))
> +#define MHI_TRE_GET_EV_LINKSPEED(tre) (FIELD_GET(GENMASK(31, 24), (MHI_T=
RE_GET_DWORD(tre, 1))))
> +#define MHI_TRE_GET_EV_LINKWIDTH(tre) (FIELD_GET(GENMASK(7, 0), (MHI_TRE=
_GET_DWORD(tre, 0))))
>=20
>  /* Transfer descriptor macros */
>  #define MHI_TRE_DATA_PTR(ptr) (cpu_to_le64(ptr))
> -#define MHI_TRE_DATA_DWORD0(len) (cpu_to_le32(len & MHI_MAX_MTU))
> -#define MHI_TRE_DATA_DWORD1(bei, ieot, ieob, chain) (cpu_to_le32((2 << 1=
6) | (bei << 10) \
> -=09| (ieot << 9) | (ieob << 8) | chain))
> +#define MHI_TRE_DATA_DWORD0(len) (cpu_to_le32(FIELD_PREP(GENMASK(15, 0),=
 len)))
> +#define MHI_TRE_TYPE_TRANSFER 2
> +#define MHI_TRE_DATA_DWORD1(bei, ieot, ieob, chain) (cpu_to_le32(FIELD_P=
REP(GENMASK(23, 16), \
> +=09=09=09=09=09=09=09MHI_TRE_TYPE_TRANSFER) | \
> +=09=09=09=09=09=09=09FIELD_PREP(BIT(10), bei) | \
> +=09=09=09=09=09=09=09FIELD_PREP(BIT(9), ieot) | \
> +=09=09=09=09=09=09=09FIELD_PREP(BIT(8), ieob) | \
> +=09=09=09=09=09=09=09FIELD_PREP(BIT(0), chain)))
>=20
>  /* RSC transfer descriptor macros */
> -#define MHI_RSCTRE_DATA_PTR(ptr, len) (cpu_to_le64(((u64)len << 48) | pt=
r))
> +#define MHI_RSCTRE_DATA_PTR(ptr, len) (cpu_to_le64(FIELD_PREP(GENMASK(64=
, 48), len) | ptr))
>  #define MHI_RSCTRE_DATA_DWORD0(cookie) (cpu_to_le32(cookie))
> -#define MHI_RSCTRE_DATA_DWORD1 (cpu_to_le32(MHI_PKT_TYPE_COALESCING << 1=
6))
> +#define MHI_RSCTRE_DATA_DWORD1 (cpu_to_le32(FIELD_PREP(GENMASK(23, 16), =
MHI_PKT_TYPE_COALESCING)
>=20
>  enum mhi_pkt_type {
>  =09MHI_PKT_TYPE_INVALID =3D 0x0,
> --
> 2.25.1

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

