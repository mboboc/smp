# smp
Microprocessor Systems laboratories.

## Vivado on Ubuntu 20.04

1. To fix the web installer Java GUI problem, temporarily change the Ubuntu version name from  20.04 to 18.04 :-

```
sudo vi /etc/os-release>
```
```
NAME="Ubuntu"
#VERSION="20.04.1 LTS (Focal Fossa)"
VERSION="18.04.4 LTS (Bionic Beaver)"
```


2. To fix the libtinfo.so.5 error :-

```
"application-specific initialization failed: couldn't load file "librdi_commontasks.so": libtinfo.so.5: cannot open shared
object file: No such file or directory"
```
```
sudo apt update
sudo apt install libtinfo-dev
sudo ln -s /lib/x86_64-linux-gnu/libtinfo.so.6 /lib/x86_64-linux-gnu/libtinfo.so.5
```

3. If it still doesn't work
```
source <path-to-where-Vivado-is-installed>/Xilinx/Vivado/2015.3/settings64.sh
```
---

## Lab 1
1. Descarci arhiva AGPtoPCI de aici: http://acs.pub.ro/~cpop/SMP/Lab1/

2. Dezarhivezi arhiva

3. Deschizi Vivado si dai Create Project

4. Dai nume proiectului
	* selectezi RTL Project -> Next -> Next
	* alegi Family=Artix7, Package=csg324
	* din lista aia selectezi **xc7a100tcsg324-1**
	* next -> finish
5. Adaugi sursele din arhiva --> Add sources
	* core_logic.v
	* graphic_controller.v
6. Ca sa mearga trebuie sa schimbi in cod
	* in core.v te uiti la irdy si trdy ce tip au
	* schimbi in graphic_controller.v cu tipul opus din core.v
	* daca irdy este input in core, in graphic il modifici sa fie output irdy, to asa si pt trdy

7. In flow navigator menu stanga
	* Create block design --> drag and drop la modulele de cod in fereastra
	* Unesti modulele pin la pin
	* Daca e pin de intrare - click dreapta --> Add external
	* Click dreapta pe block design in meniul de Sources --> create HDL wrapper

8. Creeaza fisier de test
	* Add sources -> Add or create simulation sources -> Create file 

9. Copy paste in fisierul de test
	* instantiem wrapperul
	* fisierul de test trebuie sa fie top ca sa il putm rula
```
module simulation();
reg clk;
<numele wrapperului> sim_lab1(clk);
initial begin
	clk = 0;
end
always #5 clk = ~clk;
endmodule
```

10. Simulam waveform 
	* File --> Simulation Waveform --> New configuration --> drag and drop la semnale pe grafic

!!! De fiecare data cand modificam ceva la module, refacem wrapperul ca face urat.

---

## Lab 2
1. Alegi una din cele 2 arhive de aici: http://acs.pub.ro/~cpop/SMP/Lab2/
* ImprimantaToMC68000.rar
* SRAMtoMC6800.rar

2. Dezarhivezi arhiva

3. Deschizi Vivado si dai Create Project

4. Dai nume proiectului
	* selectezi RTL Project -> Next -> Next
	* alegi Family=Artix7, Package=csg324
	* din lista aia selectezi **xc7a100tcsg324-1**
	* next -> finish
5. Adaugi sursele din arhiva --> Add sources -> \*.v

6.  