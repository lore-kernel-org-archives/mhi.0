Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE917C
	for <mhi@lists.linux.dev>; Mon, 28 Feb 2022 15:41:03 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-317-AFvCgAEnOC6V2d2xCYs19g-1; Mon, 28 Feb 2022 15:40:59 +0000
X-MC-Unique: AFvCgAEnOC6V2d2xCYs19g-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Mon, 28 Feb 2022 15:40:56 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Mon, 28 Feb 2022 15:40:56 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Manivannan Sadhasivam' <manivannan.sadhasivam@linaro.org>
CC: "mhi@lists.linux.dev" <mhi@lists.linux.dev>, "quic_hemantk@quicinc.com"
	<quic_hemantk@quicinc.com>, "quic_bbhatt@quicinc.com"
	<quic_bbhatt@quicinc.com>, "quic_jhugo@quicinc.com" <quic_jhugo@quicinc.com>,
	"vinod.koul@linaro.org" <vinod.koul@linaro.org>, "bjorn.andersson@linaro.org"
	<bjorn.andersson@linaro.org>, "dmitry.baryshkov@linaro.org"
	<dmitry.baryshkov@linaro.org>, "quic_vbadigan@quicinc.com"
	<quic_vbadigan@quicinc.com>, "quic_cang@quicinc.com" <quic_cang@quicinc.com>,
	"quic_skananth@quicinc.com" <quic_skananth@quicinc.com>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"elder@linaro.org" <elder@linaro.org>
Subject: RE: [PATCH v4 05/27] bus: mhi: Use bitfield operations for handling
 DWORDs of ring elements
Thread-Topic: [PATCH v4 05/27] bus: mhi: Use bitfield operations for handling
 DWORDs of ring elements
Thread-Index: AQHYLKD5KBrT0mkrcEuEmuVBLjzK3Kyo+w/ggAAO0ACAAAu88A==
Date: Mon, 28 Feb 2022 15:40:56 +0000
Message-ID: <8433702975794b5389563393bf7bc405@AcuMS.aculab.com>
References: <20220228124344.77359-1-manivannan.sadhasivam@linaro.org>
 <20220228124344.77359-6-manivannan.sadhasivam@linaro.org>
 <90b1d3954b8c4157a4045db82b562271@AcuMS.aculab.com>
 <20220228144336.GB12451@workstation>
In-Reply-To: <20220228144336.GB12451@workstation>
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

From: 'Manivannan Sadhasivam'
> Sent: 28 February 2022 14:44
>=20
> On Mon, Feb 28, 2022 at 02:00:07PM +0000, David Laight wrote:
> > From: Manivannan Sadhasivam
> > > Sent: 28 February 2022 12:43
> > >
> > > Instead of using the hardcoded bits in DWORD definitions, let's use t=
he
> > > bitfield operations to make it more clear how the DWORDs are structur=
ed.
> >
> > That all makes it as clear as mud.
>=20
> It depends on how you see it ;)
>=20
> For instance,
>=20
> #define MHI_TRE_GET_CMD_TYPE(tre) ((MHI_TRE_GET_DWORD(tre, 1) >> 16) & 0x=
FF)
>=20
> vs
>=20
> #define MHI_TRE_GET_CMD_TYPE(tre) (FIELD_GET(GENMASK(23, 16), (MHI_TRE_GE=
T_DWORD(tre, 1))))
>=20
> The later one makes it more obvious that the "type" field resides between=
 bit 23
> and 16. Plus it avoids the extra masking.

No, (x >> 16) & 0xff is obviously bits 23 to 16.
I can guess or try to remember what FIELD_GET() and GENMASK() do
but it is really hard work.

Both lines are actually too long to read - especially given the
number of times they are repeated with very minor changes.

I actually wonder if you shouldn't just have a struct like:
struct mhi_cmd {
=09__le64   address;
=09__le16   len;
=09u8       state;
=09u8       vid;
=09__le16   xxx; /* I can't see what this is */
=09u8       chid;
=09u8       cmd;
};

although you might need the odd anonymous union/struct
to get the overlays in.

Even using something like:
#define MAKE_WORD0(len, state, vid) (htole16(len) | state << 16 | vid << 16=
)
would make for easier reading.

Oh yes, there are some 64bit fields here.
So a 'word' is 64 bits, so a 'double word' would be 128 bits!

WTF is a DWORD anyway????
Are you going to start using DWORD_PTR as well ?????

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

