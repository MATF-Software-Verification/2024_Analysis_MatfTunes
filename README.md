# 2024_Analysis_MatfTunes

## Autor
- **Ime i prezime:** Anja Čolić  
- **Broj indeksa:** 1059/2024  

---

## 1. Informacije o projektu – *MatfTunes*
- **Repozitorijum:** [https://gitlab.com/matf-bg-ac-rs/course-rs/projects-2023-2024/MatfTunes](https://gitlab.com/matf-bg-ac-rs/course-rs/projects-2023-2024/MatfTunes)  
- **Grana:** `main`  
- **Commit hash:** `ee68f33973bf1141c0e8e77be43bd7491eb92818`  

**Opis projekta:**  
*MatfTunes* predstavlja audio plejer sa svojom bibliotekom pesama. Pesme se prvo učitavaju u biblioteku pesama, odakle je nadalje moguće puštati pesme na različite načine, menjati svaku pesmu i njene informacije, lajkovati je kao i prikazati najčešće puštane pesme. Implementrirana je funkcionalnost kreiranja i personalizacije plejlisti kao i izlistavanja i puštanja lajkovanih pesama. Takođe je moguće pretražiti pesme odnosno plejliste, i dodati tekst svake pesme pa potom pretraživati pesme po njemu.

---

## 2. Korišćeni alati i uputstva za reprodukciju analiza

Za analizu projekta korišćena su **četiri alata**, koji obuhvataju statičku i dinamičku analizu.  
Svi alati su automatizovani pomoću skripti i mogu se reprodukovati pokretanjem komandi iz korenog direktorijuma repozitorijuma.

| Alat | Namena | Pokretanje |
|------|---------|-------------|
| **Cppcheck** | Statička analiza koda – otkrivanje logičkih i stilskih grešaka | `cppcheck/./run_cppcheck.sh` |
| **Clang-Tidy** | Provera stila i konvencija | `clang-tidy/./run_clang_tidy.sh` |
| **Valgrind Memcheck** | Dinamička analiza memorije – detekcija curenja memorije i nevažećih pristupa | `valgrind/memcheck/./run_memcheck.sh` |
| **Valgrind Massif** | Profilisanje potrošnje memorije tokom rada aplikacije | `valgrind/massif/./run_massif.sh` |

Svi rezultati se automatski smeštaju u odgovarajuće `results/` foldere.  
Veći izlazni fajlovi su izuzeti iz repozitorijuma pomoću `.gitignore` datoteke.

---

## 3. Rezime zaključaka

### **Cppcheck**
1. Nisu pronađene ozbiljne logičke ili memorijske greške.  
2. Uočeni su manji problemi vezani za čitljivost koda, konzistentnost parametara i nekorišćene funkcije.  

**Preporuke:**  
- Označiti funkcije koje redefinišu virtuelne metode ključnom rečju `override`.  
- Inicijalizovati sve članove unutar listi inicijalizacije konstruktora.  
- Ukloniti nekorišćeni kod radi bolje održivosti.  

**Zaključak:**  
MatfTunes ima stabilnu i čistu bazu koda, uz minimalne predloge za poboljšanje stila i jasnoće implementacije.

---

### **Clang-Tidy**
1. Kod uglavnom poštuje moderne C++ standarde.  
2. Većina detektovanih problema su manji i stilski (npr. nedostajuće Qt generisane zaglavlja).  
3. Detektovan je potencijalni problem sa upravljanjem memorijom u funkciji `SongLibrary::addSong()`.  

**Preporuke:**  
- Regenerisati `ui_*.h` datoteke kroz Qt Creator pre statičke analize.  
- Proveriti upravljanje memorijom u `SongLibrary::addSong()`.  
- Primeniti automatske popravke iz `clang_tidy_fixes.yaml` radi veće konzistentnosti koda.  

**Zaključak:**  
Projekat je u skladu sa C++ praksama i visokog kvaliteta; jedina značajna napomena odnosi se na proveru potencijalnog curenja memorije.

---

### **Valgrind – Memcheck**
1. Nisu detektovana ozbiljna curenja memorije niti greške pri pristupu memoriji.  
2. Većina upozorenja potiče iz Qt biblioteka, što je očekivano ponašanje.  
3. Moguće male neoslobodene alokacije u `MainWindow::addSongButton()` i `SongLibrary`.  

**Preporuke:**  
- Koristiti pametne pokazivače (`std::unique_ptr`, `std::shared_ptr`) za automatsko oslobađanje memorije.  
- Proveriti destruktore klasa `MainWindow` i `SongLibrary`.  

**Zaključak:**  
Dinamička analiza pokazuje stabilno upravljanje memorijom bez kritičnih curenja.

---

### **Valgrind – Massif**
1. Nisu pronađena curenja memorije.  
2. Najveći potrošači memorije su funkcije povezane sa inicijalizacijom Qt GUI komponenti.  
3. Peak potrošnje memorije iznosi oko **22.6 MiB**, što je očekivano za multimedijalne aplikacije.  
4. Nakon inicijalizacije, zauzeće memorije se stabilizuje.  

**Preporuke:**  
- Za buduće testove skalabilnosti, ponoviti analizu sa većom bibliotekom pesama radi praćenja rasta heap memorije.  

**Zaključak:**  
Aplikacija pokazuje normalan obrazac potrošnje memorije, bez curenja i sa stabilnim ponašanjem tokom rada.


**Opšti zaključak:**  
MatfTunes projekat pokazuje visok nivo stabilnosti i održivosti koda.  
Većina upozorenja potiče iz internih mehanizama Qt-a, dok je korisnički kod stabilan i dobro strukturiran.  
Rezultati svih analiza potvrđuju da aplikacija funkcioniše bez kritičnih grešaka i da efikasno upravlja resursima.

---

## 4. Struktura repozitorijuma

```plaintext
.
├── clang-tidy
│   ├── build
│   ├── llvm.sh
│   ├── results
│   │   ├── clang_tidy_fixes.yaml
│   │   └── clang_tidy_report.txt
│   ├── run_clang_tidy.sh
│   └── ScriptStartingScreenshot.png
├── cppcheck
│   ├── cppcheck_build
│   ├── CppCheckScreenshot.png
│   ├── html-report
│   │   ├── 0.html
│   │   ├── 10.html
│   │   ├── 11.html
│   │   ├── 12.html
│   │   ├── 1.html
│   │   ├── 2.html
│   │   ├── 3.html
│   │   ├── 4.html
│   │   ├── 5.html
│   │   ├── 6.html
│   │   ├── 7.html
│   │   ├── 8.html
│   │   ├── 9.html
│   │   ├── index.html
│   │   ├── stats.html
│   │   └── style.css
│   ├── results
│   │   ├── cppcheck_2025-10-20_00-02.txt
│   │   ├── cppcheck_2025-10-20_00-04.txt
│   │   ├── cppcheck_2025-10-20_00-07.txt
│   │   └── cppcheck_2025-10-20_00-07.xml
│   └── run_cppcheck.sh
│   ├── modules
│   │   └── matftunes
├── .github
│   └── workflows
│       ├── gate.yml
│       └── tickets.yml
├── .gitignore
├── .gitmodules
├── matftunes
├── ProjectAnalysisReport.md
├── project_structure.txt
├── README.md
└── valgrind
    ├── massif
    │   ├── MassifScreenshot.png
    │   ├── results
    │   │   └── massif_2025-10-20_17-16.out
    │   ├── run_massif.sh
    │   └── TerminalScreenshot.png
    └── memcheck
        ├── LeakSummaryScreenshot.png
        ├── results
        │   └── memcheck_2025-10-20_02-35.log
        ├── run_memcheck.sh

