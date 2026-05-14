## This File contains screenshots of Resource group, VNets, subnets and peering Configurations.

### Created Rg-Security, Rg-App, Rg-Data resource groups in mysub subscription
<img width="684" height="485" alt="1" src="https://github.com/user-attachments/assets/e231c45c-440e-42ba-b17c-4976203bbdd9" />

### Created AzFirewall VNet in Rg-Security
<img width="681" height="491" alt="2" src="https://github.com/user-attachments/assets/564f1bc3-b3db-446b-8202-91a0068f06b1" />

### Created App VNet in Rg-App
<img width="680" height="485" alt="3" src="https://github.com/user-attachments/assets/08219b83-5f8d-4906-ace6-bd140d3ffc28" />

### Created Data VNet in Rg-Data
<img width="681" height="491" alt="4" src="https://github.com/user-attachments/assets/eefd75ef-8905-4347-8e86-7c27d43d0cb8" />

### Retrived all the VNet ids and stored them in variables.
<img width="678" height="311" alt="5" src="https://github.com/user-attachments/assets/2b2e55f5-56f8-47ca-bad2-66ca0cb396e1" />

### VNet Peering Firewall <-> App
<img width="681" height="490" alt="6" src="https://github.com/user-attachments/assets/6a1a5af6-07ef-4b20-b95a-ccbd25b5f1dc" />

<img width="685" height="452" alt="7" src="https://github.com/user-attachments/assets/ab2a770b-bc10-46ec-bb9b-d9a2a216dd12" />

### VNet Peering Firewall <-> Data
<img width="677" height="481" alt="8" src="https://github.com/user-attachments/assets/de7cd2c6-43a7-442d-b4f1-61c655984f21" />

<img width="697" height="524" alt="9" src="https://github.com/user-attachments/assets/e3b98b43-f9dc-4760-9cfb-c1585cbc8439" />

### Created NIC first for webvm
<img width="685" height="497" alt="10" src="https://github.com/user-attachments/assets/696dbe23-98df-47bf-be1d-33dbe58028f8" />

### Created webvm VM
<img width="701" height="365" alt="11" src="https://github.com/user-attachments/assets/e719336d-457d-404e-9fe5-de0398b9157b" />

### Created NIC first for dbvm
<img width="680" height="536" alt="12" src="https://github.com/user-attachments/assets/3300f9bb-13ad-4888-afc2-0981ae6bafd3" />

### Created dbvm VM
<img width="701" height="412" alt="13" src="https://github.com/user-attachments/assets/cf309f7e-4b29-4f28-bf32-f39a63565cb4" />

### NSG Created in App VNet
<img width="658" height="463" alt="21" src="https://github.com/user-attachments/assets/c5dc4637-5851-4de6-a58c-a4adc917a8f9" />

Created NSG rule in App VNet that allows port 22 (SSH)traffic

<img width="664" height="326" alt="22" src="https://github.com/user-attachments/assets/218e8857-b75b-4969-a6f2-7c7e779e475e" />

Created NSG rule in App VNet that allows 3306 port traffic from 10.2.1.0/24 

<img width="701" height="438" alt="27" src="https://github.com/user-attachments/assets/735b3dea-3194-487b-a88d-86ed8a6fe102" />

### Created NSG in Data VNet
<img width="699" height="530" alt="24" src="https://github.com/user-attachments/assets/215bddef-0a22-47e5-8a66-cb8ecd5ea5ea" />

### NSG Created in Data VNet
<img width="707" height="551" alt="25" src="https://github.com/user-attachments/assets/6a54f453-7915-4eec-a0cd-cc382324c15e" />

### Started the dbvm VM
<img width="695" height="410" alt="29" src="https://github.com/user-attachments/assets/bc145bc5-8231-4547-bb96-9e051f11a41c" />

### Installed MySql in  dbvm and changed the bind-address to 0.0.0.0:3306
<img width="689" height="553" alt="35" src="https://github.com/user-attachments/assets/73c68f49-399a-4967-8ebb-36dcb54dec85" />

<img width="668" height="343" alt="36" src="https://github.com/user-attachments/assets/fde0e531-7309-4e39-9f03-78190c8ce7e6" />

<img width="683" height="236" alt="37" src="https://github.com/user-attachments/assets/f2d4b588-d417-479d-bd74-867ed493e7a4" />

<img width="682" height="555" alt="38" src="https://github.com/user-attachments/assets/e7fc641b-1638-4ad4-996d-96b16b596ed3" />

### Started the webvm VM
<img width="692" height="523" alt="32" src="https://github.com/user-attachments/assets/f16cc670-f74d-4b34-ba71-2d850ed7c421" />



Portal Screenshots:

<img width="953" height="446" alt="14" src="https://github.com/user-attachments/assets/acd929bd-8f6d-415e-a2cb-f5afe2d70060" />

<img width="845" height="450" alt="15" src="https://github.com/user-attachments/assets/6f1589df-d787-4f66-afb5-e628e8c0314c" />

<img width="828" height="404" alt="16" src="https://github.com/user-attachments/assets/5eecb3d3-c326-411a-9efb-09bce52a2d88" />

<img width="959" height="380" alt="17" src="https://github.com/user-attachments/assets/e2975513-0dd5-4bc0-9464-bb6a65f3c263" />

<img width="839" height="419" alt="18" src="https://github.com/user-attachments/assets/1db1214a-7f3c-473c-ad1a-b75dee56521b" />

<img width="818" height="446" alt="19" src="https://github.com/user-attachments/assets/b979c9a4-a067-43d2-87b2-5c555c3c6646" />

<img width="857" height="334" alt="20" src="https://github.com/user-attachments/assets/989c3072-7fa0-44e5-92ae-464257b03a27" />

<img width="959" height="495" alt="23" src="https://github.com/user-attachments/assets/469e7f02-4460-4a94-9444-f1501923df19" />

<img width="957" height="507" alt="26" src="https://github.com/user-attachments/assets/e69148cb-2613-403a-9119-b9bdbfdd1b20" />

<img width="980" height="505" alt="28" src="https://github.com/user-attachments/assets/94b514d7-9519-41b0-b99c-39c2e1608bd2" />

webvm Output:

<img width="692" height="523" alt="32" src="https://github.com/user-attachments/assets/dcf9e7a3-95bc-4656-b75e-4ca77daa485e" />

<img width="573" height="193" alt="33" src="https://github.com/user-attachments/assets/33176786-eaa1-428f-9fb3-bed70eb311b9" />

<img width="692" height="155" alt="34" src="https://github.com/user-attachments/assets/2a264e8d-9d71-4ad3-9e62-92afe850195b" />

