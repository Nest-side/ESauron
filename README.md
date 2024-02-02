# ESauron

The cost and size of the current ESauron system is mainly in the software-defined radios (USRP B210) and computing device (laptop). 

We are working on hosting our system on Raspberry Pi (PiSDR) to replace laptop and miniaturize ESauron system, and using a customized low-cost USRP (RTLSDR) to replace B210 for cost reduction. 

A miniaturized prototype will be available soon. 

We will release our code and data in this open-source project soon.

Test Data:
Link：https://pan.baidu.com/s/1UWDWJ9RFNAHwyigpL6_eOg?pwd=hfn3 



Demo:

Due to multipath effects, the EMR RSS does not strictly follow the Friis path-loss model, but the general trend of RSS decreases over distance is invariant.
We observe that although there are several solid or weak points in the middle, the RSS preservation after filtering continues to decline.
The user needs to move the receiver along each axis:

Front to back:

![Front to back](https://github.com/Nest-side/ESauron/assets/147241807/02223f5b-cec0-4cee-a3d6-0851d2c0bd72)

Left to right:

![Left to right](https://github.com/Nest-side/ESauron/assets/147241807/e4b3150e-ae39-4f74-859c-cef21bb8f937)

Stimulate: Increasing the number of stimulation rounds can also compensate for the effect of light conditions. Even with a light intensity of 200 Lux. After multiple rounds of stimulation, strong EMR fluctuations can still be detected at a detection distance of more than 6m.

![Stimulate](https://github.com/Nest-side/ESauron/assets/147241807/2e659212-a812-48b0-bbe3-385eadec04b0)


We conduct extensive measurement study on 50 camera products and observe that the spectrum pattern of memory EMR has distinctive static and dynamic characteristics, presenting a unique fingerprint. For the former, the offset of harmonic frequencies is sufficiently diverse across different memory models, which should be attributed to the different modulation frequencies of their clock generators. For the latter, due to imperfect manufacturing processes and memory heating effect, the clock frequency presents a dynamic and unique drift pattern, which differs across memory products even with the same model. ESauron thus exploits such memory clock fingerprints to separate and track each spy camera’s memory EMRs (see Sec. 4.3 in paper), which is decisive to practical usage scenarios. 
 
Two camera: Devices with the same memory frequency have obvious frequency aliasing.

![Two camera](https://github.com/Nest-side/ESauron/assets/147241807/78674882-7fb4-47a0-9061-97ddb137ecd3)

Unique fingerprint:

![untitled](https://github.com/Nest-side/ESauron/assets/147241807/70bc185f-ca38-4634-a8f6-54b75f21181c)
