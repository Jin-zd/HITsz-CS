1.报文交换：
总时间 $T = \frac{12\ \text{Mb}}{20\ \text{Mb/s}} \times 2 = 1.2\text{ s}$

分组交换:
每个分组传输 $T_{\text{分组}} = \frac{10\ \text{kb}}{20\ \text{Mb/s}} =  0.5\text{ ms}$
分组总数 $N = \frac{12\ \text{Mb}}{10\ \text{kb}} = 1200\ \text{个}$

第一分组在第一段链路传输需 \(0.0005\) s，到达路由器后再传输到主机乙需 \(0.0005\) s，总时延 \(= 0.001\) s。
当第一分组开始在第二段传输时，后续分组正按 \(0.0005\) s/个的速率在第一段传输。
最后一个分组完成第一段传输的时间为 $1200 \times 0.0005\text{ s} = 0.6\text{ s}$
最后一个分组还需 \(0.0005\) s在第二段传输，因此 $T = 0.6\text{ s} + 0.0005\text{ s} = 0.6005\text{ s}$

2.（1）$\text{RTT} = \frac{3.85 \times 10^8\,\text{m}}{3 \times 10^8\,\text{m/s}} \times 2 \approx 2.57\,\text{s}$

（2）$2.57\,\text{s} \times 100 \times 10^6\,\text{bit/s} \div 8 \approx 32.1\,\text{MB}$

（3）该值表示在传输过程中链路上最多同时存在的数据量。

（4）$2.57\,\text{s} + \frac{25\,\text{MB} \times 8}{100\,\text{Mb/s}} \approx 4.57\,\text{s}$

3.（1）作为单个分组
总时间 $\frac{10000\ \text{bit}}{10^7\ \text{bit/s}} + 20 + 35 + 1000 + 20 = 2075\ \mu\text{s}$

（2）作为两个 5000bit 的分组连续发送
第一个分组到达B的时间：\( 500 + 20 + 35 + 500 + 20 = 1075\ \mu\text{s} \)
第二个分组到达B的时间：\( 1555 + 20 = 1575\ \mu\text{s} \)
总时间：由最后一个分组的到达时间决定，即 \( 1575\ \mu\text{s} \)。

4.$R = \frac{2400 \text{ b/s}}{\log_{2}4} = 1200 \text{b/s}$ 

5.每个符号携带的比特数：$\log_2 4 = 2 \text{ bit/符号}$
$\text{符号率} = 2 \times 200 \text{ kHz} = 400 \text{ k符号/秒}$
$C = 400 \text{ k符号/秒} \times 2 \text{ bit/符号} = 800 \text{ kb/s}$

6.$\text{SNR} = 10^{\text{SNR}_{\text{dB}} / 10} = 10^{30 / 10} = 1000$
$C = 3000 \log_2 (1 + 1000) \approx 30 \text{ kb/s}$
