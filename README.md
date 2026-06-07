# contracts-Empire.sol
sistem power
# Empire Smart Contract 🏰

Empire, Binance Smart Chain (BSC) üzerinde çalışmak üzere tasarlanmış, gelen ödemeleri otomatik olarak paylaştıran güvenli bir akıllı sözleşmedir (Smart Contract).

## 📖 Proje Hakkında

Bu akıllı sözleşme, dışarıdan (herhangi bir cüzdandan) BNB/ETH transferi aldığında, gelen miktarın **%5'ini** anında önceden belirlenmiş sabit bir cüzdana (Pay Alıcı) aktarır. Geriye kalan %95'lik bakiye kontrat içerisinde güvenle saklanır ve yalnızca kontrat sahibi (Owner) tarafından çekilebilir.

## ✨ Özellikler

* **Otomatik Kar Paylaşımı:** Kontrata gelen her transferin %5'i otomatik olarak `0xA4A6c7d8Cd51A4Eed3C93B91Cb7Cb00f4601335D` adresine gönderilir.
* **Sahip Kontrolü (Owner):** Kontratı kim deploy ederse, sahibi o olur (Immutable Owner). İçeride biriken bakiyeyi sadece bu kişi çekebilir.
* **Üst Düzey Güvenlik:** OpenZeppelin'in `ReentrancyGuard` modülü kullanılarak, para çekme işlemleri sırasındaki olası "Yeniden Giriş" (Reentrancy) saldırılarına karşı tam koruma sağlanmıştır.
* **Düşük Gaz Maliyeti:** Kontratın basitleştirilmiş yapısı ve `constant` / `immutable` değişken kullanımı sayesinde ağ ücretleri (gas fee) minimize edilmiştir.

## 🛠 Fonksiyonlar

* `receive()`: Sözleşmeye dışarıdan BNB gönderildiğinde otomatik tetiklenir. Gelen paranın %5'ini hesaplar, pay alıcısına gönderir. Geri kalanını sözleşmede tutar.
* `withdraw()`: (Sadece Owner) Sözleşmede biriken tüm bakiyeyi kontrat sahibinin cüzdanına güvenli bir şekilde aktarır.
* `getBalance()`: Sözleşmenin o anki güncel bakiyesini gösterir. Herkes tarafından görüntülenebilir (View).

## 🚀 Dağıtım (Deployment)

Bu kontrat **Remix IDE** kullanılarak başarıyla ağa yüklenmiştir. Yeniden derlemek veya kendi ağınızda test etmek isterseniz:

1. [Remix IDE](https://remix.ethereum.org/)'yi açın.
2. Yeni bir dosya oluşturup adını `Empire.sol` yapın.
3. Bu repodaki kontrat kodlarını dosyaya yapıştırın.
4. **Solidity Compiler** sekmesinden `0.8.20` veya daha üstü bir versiyon seçip derleyin.
5. **Deploy & Run Transactions** sekmesinden ortamı (Environment) *Injected Provider - MetaMask* olarak seçin.
6. Deploy butonuna basıp işlemi onaylayın.

> **Not:** Kontratın kaynak kodu, dış bağımlılık olarak doğrudan OpenZeppelin'in GitHub reposundan `ReentrancyGuard.sol` dosyasını çekmektedir.

## 🔒 Güvenlik Notları

* Sözleşmedeki tüm hata mesajları gizlilik ve standartlık amacıyla `"Tum haklar saklidir"` olarak belirlenmiştir.
* Pay alıcı adresi (`PAY_ALICI`) sözleşmeye *constant* olarak gömülmüştür ve sonradan değiştirilemez. Bu da sistemin şeffaflığını ve güvenilirliğini artırır.

## 📄 Lisans

Bu proje **MIT Lisansı** ile lisanslanmıştır.
