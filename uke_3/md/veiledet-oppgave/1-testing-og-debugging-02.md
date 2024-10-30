### **Oppgave 6: Snapshot Testing**

**Mål:** Forstå grunnprinsippene for snapshot testing og hvordan det kan brukes for å sikre at UI ikke endres utilsiktet.

**Beskrivelse:**  

I CV-appen, tenk deg at du har en komponent som viser brukerens utdanningshistorikk. Vi skal skrive en Jest snapshot-test for denne komponenten for å sikre at den ikke endres utilsiktet i fremtidige oppdateringer av koden.  

[Link: Snapshot Testing med Jest](https://jestjs.io/docs/snapshot-testing)

<details><summary>Løsning</summary>

#### **Steg 1: Installere nødvendige avhengigheter**

Før vi kan skrive snapshot-tester, må vi sørge for at vi har installert Jest og React Test Renderer. Kjør følgende kommandoer i terminalen din:

```bash
npm install --save-dev jest react-test-renderer
```

**Sørg for at du kjører kommandoene i rotmappen til prosjektet ditt for å unngå installasjonsproblemer.**

#### **Steg 2: Opprette Snapshot Test**

Nå som vi har installert nødvendige avhengigheter, kan vi opprette en snapshot-test for `EducationHistory`-komponenten. Lag en ny fil, for eksempel `EducationHistory.test.js`, og legg til følgende kode:

```javascript
import renderer from 'react-test-renderer';
import EducationHistory from './EducationHistory';

test('EducationHistory component renders correctly', () => {
  const tree = renderer.create(<EducationHistory />).toJSON();
  expect(tree).toMatchSnapshot();
});
```

#### **Forklaring av koden:**

1. **Importere nødvendige moduler:**

   ```javascript
   import renderer from 'react-test-renderer';
   import EducationHistory from './EducationHistory';
   ```

   Vi importerer `react-test-renderer` for å kunne lage en snapshot av komponenten, og `EducationHistory`-komponenten som vi skal teste.

2. **Opprette snapshot-testen:**
   ```javascript
   test('EducationHistory component renders correctly', () => {
     const tree = renderer.create(<EducationHistory />).toJSON();
     expect(tree).toMatchSnapshot();
   });
   ```
   - `renderer.create(<EducationHistory />).toJSON();` lager en JSON-representasjon av `EducationHistory`-komponenten.
   - `expect(tree).toMatchSnapshot();` sammenligner den genererte JSON-representasjonen med en tidligere lagret snapshot. Hvis det ikke finnes en tidligere snapshot, vil Jest opprette en ny.

#### **Steg 3: Kjøring av testen**

For å kjøre testen, legg til følgende script i `package.json`-filen din:

```json
"scripts": {
  "test": "jest"
}
```

Kjør deretter testen ved å kjøre følgende kommando i terminalen:

```bash
npm test
```

</details>

> [!TIP]
> Du kan også bruke `npm test -- --watch` for å kjøre testene kontinuerlig mens du utvikler.

#### **Hva skjer når testen kjører?**

Når du kjører testen for første gang, vil Jest opprette en snapshot-fil som inneholder JSON-representasjonen av `EducationHistory`-komponenten. Denne filen lagres i en mappe kalt `__snapshots__`.

#### **Hvorfor er snapshot testing nyttig?**

Snapshot testing er nyttig fordi det lar oss fange utilsiktede endringer i UI-komponenter. Hvis noen endrer `EducationHistory`-komponenten i fremtiden, vil snapshot-testen feile hvis den nye outputen ikke matcher den lagrede snapshoten. Dette gir oss en mulighet til å gjennomgå endringene og bekrefte at de er forventet.

#### **Oppsummering**

Med snapshot testing kan vi sikre at komponentens output ikke endres utilsiktet over tid. Dette er spesielt nyttig i store prosjekter hvor mange utviklere jobber på samme kodebase, da det hjelper med å opprettholde konsistens i UI-komponentene.

### **Feilsøkingsoppgave: Finn Feilen i Snapshot Testen**

**Mål:** Lære å identifisere og rette feil i snapshot tester.

**Beskrivelse:**  
I denne oppgaven skal du finne og rette en feil i en snapshot-test for `EducationHistory`-komponenten. Koden nedenfor inneholder en feil som gjør at snapshot-testen feiler. Din oppgave er å finne og rette feilen slik at testen kjører korrekt.

```javascript
import renderer from 'react-test-renderer';
import EducationHistory from './EducationHistory';

test('EducationHistory component renders correctly', () => {
  const tree = renderer.create(<EducationHistory />).toJSON();
  expect(tree).toMatchSnapshot();
});
```

<details><summary>Løsning</summary>

Feilen i koden ligger i importeringen av `EducationHistory`-komponenten. Sørg for at filbanen til `EducationHistory` er korrekt. Hvis komponenten ligger i en annen mappe, må du oppdatere importbanen.

For eksempel, hvis `EducationHistory`-komponenten ligger i en undermappe kalt `components`, bør importen se slik ut:

```javascript
import renderer from 'react-test-renderer';
import EducationHistory from './components/EducationHistory';

test('EducationHistory component renders correctly', () => {
  const tree = renderer.create(<EducationHistory />).toJSON();
  expect(tree).toMatchSnapshot();
});
```

Ved å rette filbanen til `EducationHistory`-komponenten, vil snapshot-testen kjøre korrekt og sammenligne komponentens output med den lagrede snapshoten.

</details>