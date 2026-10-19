# 🏦 Banka Telefon Pazarlamasında Vadeli Mevduat Aboneliği Tahmini

**TNC Group — Makine Öğrenmesi ile Probleme Uygun Çözüm Geliştirme** · Hazırlayan: Elif DELAL

Bir bankanın telefon kampanyalarında, müşterinin vadeli mevduata abone olup olmayacağını **arama yapılmadan önce**
tahmin eden ikili sınıflandırma çalışması. Lojistik Regresyon, Random Forest ve HistGradientBoosting karşılaştırılmıştır.

[![Colab'da aç](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/elifdelal/banka-pazarlama-tahmini/blob/main/Banka_Pazarlama_Tahmini.ipynb)

## 📊 Sonuçlar (test seti, 8.236 müşteri)

| Model | Precision | Recall | F1 | ROC-AUC | PR-AUC |
|---|---|---|---|---|---|
| Dummy (çoğunluk sınıfı) | 0,000 | 0,000 | 0,000 | 0,500 | 0,113 |
| Lojistik Regresyon | 0,453 | 0,578 | 0,508 | 0,800 | 0,454 |
| Random Forest | 0,459 | 0,614 | 0,526 | 0,811 | 0,489 |
| **HistGradientBoosting** | **0,469** | **0,610** | **0,530** | **0,815** | **0,497** |

* Olasılığa göre sıralanan listenin ilk %20'si arandığında abonelerin **%67**'si yakalanır (rastgele aramaya göre 3,4 kat).
* `duration` (görüşme süresi) arama bitmeden bilinemediği için **veri sızıntısı** olarak modelden çıkarılmıştır.
* Zaman bazlı doğrulamada (geçmişle eğit, gelecekte test et) Lojistik Regresyon daha dayanıklıdır — ayrıntılar raporda.

## 📁 Dosyalar

| Dosya | İçerik |
|---|---|
| `Banka_Pazarlama_Tahmini.ipynb` | Tüm analiz: veri keşfi, ön işleme, modeller, değerlendirme, hata analizi (çıktılarıyla) |
| `Proje_Raporu_Elif_DELAL.pdf` / `.docx` | Proje raporu |
| `veri/bank-additional-full.csv` | Veri seti (41.188 satır, 20 değişken + hedef) ve `bank-additional-names.txt` açıklaması |
| `grafikler/` | Rapordaki tüm şekiller |
| `sonuclar/metrikler.json` | Tüm metrikler (rapor tabloları buradan üretilir) |
| `araclar/` | Not defterini ve raporu yeniden üreten betikler |

## 🗂️ Veri seti

UCI Machine Learning Repository — **Bank Marketing** (Moro, Cortez & Rita, 2014), lisans CC BY 4.0:
<https://archive.ics.uci.edu/dataset/222/bank+marketing>

## ▶️ Çalıştırma

**Google Colab:** Yukarıdaki rozete tıklayın → *Çalışma zamanı → Tümünü çalıştır*. Veri dosyası bulunamazsa not defteri
UCI'den otomatik indirir.

**Bilgisayarda:**
```bash
pip install -r requirements.txt
jupyter nbconvert --to notebook --execute --inplace Banka_Pazarlama_Tahmini.ipynb
```
Not defteri yaklaşık 3 dakikada çalışır; grafikler `grafikler/`, metrikler `sonuclar/` klasörüne yazılır.
Raporu yeniden üretmek için: `python araclar/rapor_olustur.py`.
