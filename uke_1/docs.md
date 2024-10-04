# Uke 1

1. [Innføring i introduksjon til `React`](#1-innføring-i-introduksjon-til-react)
    - [Forutsetninger og installasjon](#forutsetninger-og-installasjon)
      - [Node.js & npm](#nodejs--npm)
      - [Hva er vite?](#hva-er-vite)
      - [Instruksjoner for installasjon](#instruksjoner-for-installasjon)
    - [Opprette ditt første React-prosjekt](#opprette-ditt-første-react-prosjekt)
    - [Innføring i `index.js` og `App.js`](#innføring-i-indexjs-og-appjs)
      - [`index.js`](#indexjs)
      - [`App.js`](#appjs)
    - [DOM vs. ReactDOM](#dom-vs-reactdom)
    - [Struktur av en typisk React-kodefil](#struktur-av-en-typisk-react-kodefil)
    - [`.js` filer vs `.jsx` filer](#js-filer-vs-jsx-filer)
    - [Dypdykk i `package.json`](#dypdykk-i-packagejson)
    - [Hvordan npm og npx fungerer](#hvordan-npm-og-npx-fungerer)
2. [Innføring i `Components` & `Props` i React](#2-innføring-i-components--props-i-react)
    - [Komponenter i React](#komponenter-i-react)
      - [Hva er en komponent?](#hva-er-en-komponent)
      - [Typer av komponenter](#typer-av-komponenter)
      - [Sammenslåtte komponenter](#sammenslåtte-komponenter)
    - [Props i React](#props-i-react)
      - [Hva er Props?](#hva-er-props)
      - [Hvordan bruke Props?](#hvordan-bruke-props)
      - [Props er Read-Only](#props-er-read-only)
      - [Bruke Props i Klassekomponenter](#bruke-props-i-klassekomponenter)
      - [Fordeler med Props](#fordeler-med-props)


# **1. Innføring i introduksjon til `React`**

React er et populært JavaScript-bibliotek for å bygge brukergrensesnitt. Det er kjent for sin komponentbaserte arkitektur og den virtuelle DOM, som gir effektive og raske oppdateringer av brukergrensesnittet.

## Forutsetninger og installasjon

Før du starter med React, trenger du noen forutsetninger:

### 1. Node.js & npm

React krever Node.js, en JavaScript runtime, for å kjøre. Sammen med Node.js kommer npm (Node Package Manager), som lar deg administrere og installere JavaScript-biblioteker og verktøy.

- **Hvorfor trenger vi Node.js?**
  - Selv om React kjører i nettleseren, bruker vi Node.js for verktøy som bygger, tester og kjører utviklingsserveren.
  
- **Hva er npm?**
  - npm er verdens største programvarebibliotek. Det hjelper med å installere ulike biblioteker (som React) og verktøy (som `Vite`) som er nødvendige for moderne webutvikling.

- **Hva er vite?**
  - `Vite` er et **build-verktøy** og **utviklingsserver** for moderne webapplikasjoner. Det hjelper utviklere med å sette opp og kjøre prosjekter raskere ved å tilby en effektiv måte å håndtere og kompilere kildekode på, spesielt når man jobber med teknologier som JavaScript, TypeScript, Vue.js, React, og andre moderne rammeverk.
  - **Hot Module Replacement (HMR):** Oppdaterer automatisk endringer du gjør i koden, uten å måtte laste hele siden på nytt.

**Instruksjoner for installasjon:**
1. Last ned og installer [Node.js](https://nodejs.org/).
2. Etter installasjon, åpne terminalen eller kommandolinjen og kjør `node -v` og `npm -v` for å sikre at både Node.js og npm er installert riktig.
3. Nå er du klar til å opprette din første React-applikasjon!

## Opprette ditt første React-prosjekt

Med Node.js og npm installert, kan du enkelt opprette et nytt React-prosjekt ved å bruke:
```bash
npm create vite@latest
```

Når du oppretter et nytt prosjekt med `create vite@latest`, får du følgende filstruktur:

- `public/`: Dette mappen inneholder statiske filer. Den viktigste er `index.html`, som er hovedHTML-filen din. Alle React-komponenter festes her.
- `src/`: Dette er mappen der all React-kode skal ligge. Den inkluderer komponenter, stiler, og annen JavaScript-kode.
- `node_modules/`: Når du installerer pakker via npm, lagres disse bibliotekene i denne mappen. Her er alle avhengigheter som prosjektet ditt trenger.
- `package.json`: En viktig konfigurasjonsfil som inneholder informasjon om prosjektet ditt, som prosjektets navn, versjon og avhengigheter.

## Innføring i `index.js` og `App.js`

### `index.js`

`index.js` fungerer som inngangspunktet for en React-applikasjon. Den er ansvarlig for å feste (mount) den overordnede appkomponenten til DOM-en. 

```javascript
import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
import './index.css';

ReactDOM.render(<App />, document.getElementById('root'));
```

Her er de viktigste delene av koden:

1. **Imports**:
   - `React` fra `react`: Selve React-biblioteket.
   - `ReactDOM` fra `react-dom`: Lar oss manipulere DOM ved hjelp av React-komponenter.
   - `App` fra `./App`: Dette er hovedkomponenten for applikasjonen.
   - `./index.css`: Globale stiler for applikasjonen.

2. **ReactDOM.render()**:
   - Denne funksjonen tar to argumenter: En React-komponent og en DOM-node.
   - I eksempelet ovenfor, blir `App`-komponenten festet til DOM-elementet med id `root`.

### `App.js`

`App.js` er vanligvis der du finner hovedkomponenten for applikasjonen. I en enkel `create-react-app`-applikasjon, vil den ofte se slik ut:

```javascript
import React from 'react';
import './App.css';

const App = () => {
  return (
    <div className='App'>
      <header className='App-header'>
        <h1>Welcome to My React App</h1>
      </header>
    </div>
  );
}

export default App;
```

Noen nøkkelpunkter fra denne filen:

1. **Imports**:
   - `React` fra `react`: Selv om JSX er brukt, trenger vi å importere React.
   - `./App.css`: Stilene spesifikke for denne komponenten.

2. **App-komponenten**:
   - Definert som en arrow funksjon.
   - Returnerer JSX som beskriver hvordan komponenten skal se ut.

3. **Export**:
   - `App`-komponenten blir eksportert for å kunne brukes i andre filer, som `index.js`.

### DOM vs. ReactDOM

**DOM** står for Document Object Model og er en programmeringsgrensesnitt for webdokumenter. Den representerer siden slik at programmer kan endre dokumentstrukturen, stilen og innholdet. Når du ber nettleseren om å vise en nettside, konverterer nettleseren HTML-teksten til DOM.

**ReactDOM** er en bibliotek som lar deg manipulere DOM på en effektiv måte fra React-kode. Den sammenligner komponentens ønskede tilstand med den nåværende, og oppdaterer DOM for deg, kun der det er nødvendig. Dette kalles 'reconciliation', og det er grunnen til at React kan være så rask.

Når du bruker React og ReactDOM sammen, skriver du hva du vil at UI-en skal se ut som til enhver tid, og React sørger for at DOM matcher denne beskrivelsen.

## Struktur av en typisk React-kodefil

En vanlig React-kodefil er ofte bygd opp slik:

```javascript
import React from 'react';

const MinKomponent = (props) => {
    return <div>Hei {props.navn}!</div>;
}

export default MinKomponent;
```

1. **Imports**:
   Her importerer du nødvendige moduler og biblioteker øverst i filen.
   ```javascript
   import React from 'react';
   ```

2. **Komponentdefinisjon**:
   Dette er selve komponenten, som kan defineres som en funksjonskomponent eller en klassekomponent.
   ```javascript
   const MinKomponent = () => {
     return <h1>Hei, verden!</h1>;
   };
   ```

3. **Exports**:
   For å gjøre komponenten tilgjengelig for andre filer, eksporterer du den.
   ```javascript
   export default MinKomponent;
   ```
## `.js` filer vs `.jsx` filer
### `.js` Filer

- **Utvidelse:** `.js` står for JavaScript.
- **Innhold:** Inneholder ren JavaScript-kode eller ES6+ kode.
- **Bruksområder:** Brukt for alle typer JavaScript-oppgaver, enten det er på serveren (som i Node.js) eller på klienten.
- **Støtte:** Alle JavaScript-miljøer, inkludert nettlesere og Node.js, kan kjøre `.js` filer direkte.

```javascript
const add = (a, b) => {
    return a + b;
}
```

### `.jsx` Filer

- **Utvidelse:** `.jsx` står for JavaScript XML.
- **Innhold:** Inneholder JavaScript-kode blandet med en XML-lignende syntaks. Denne syntaksen gjør det mulig å skrive HTML-lignende kode direkte i JavaScript.
- **Bruksområder:** Hovedsakelig brukt med React for å definere komponenter. Komponentene ser ofte ut som vanlig HTML, men er faktisk funksjoner eller klasser som returnerer React-elementer.
- **Støtte:** `.jsx` filer kan ikke kjøres direkte i nettlesere eller Node.js uten en transpiler, som Babel, fordi nettlesere forstår kun ren JavaScript. Babel konverterer `.jsx` kode til vanlig JavaScript som nettlesere kan tolke.

```jsx
const WelcomeMessage = () => {
    return <h1>Hello, world!</h1>;
}
```

## Hovedforskjeller

1. **Syntaks:** Mens `.js` filer inneholder ren JavaScript, kan `.jsx` filer inneholde JavaScript blandet med en XML-lignende syntaks.
2. **Bruksområde:** `.jsx` filer brukes spesielt med React for å definere komponenter, mens `.js` filer brukes i mange JavaScript-sammenhenger.
3. **Transpilering:** `.jsx` filer trenger en transpiler som Babel for å konvertere koden til vanlig JavaScript før den kjøres i en nettleser, mens `.js` filer ikke nødvendigvis trenger det.


Valget mellom `.js` og `.jsx` avhenger av hva du prøver å oppnå. Hvis du arbeider med React og skriver komponenter, vil du sannsynligvis bruke `.jsx`. Men for generelle JavaScript-oppgaver, vil `.js` være det naturlige valget.

## Dypdykk i `package.json`

`package.json` er hjertet av enhver Node.js-applikasjon eller -modul. For en React-app vil den inneholde:

- **metadata** om prosjektet ditt, som navn, versjon og beskrivelse.
- **scripts**: Kommandoer du kan kjøre, som starter utviklingsserveren, bygger appen for produksjon, osv.
- **dependencies**: Dette er biblioteker og verktøy prosjektet ditt trenger for produksjon.
- **devDependencies**: Biblioteker og verktøy som trengs for utvikling, men som ikke vil bli inkludert i produksjonsbyggingen.

Når du kjører en kommando som `npm install react`, legger npm til 'react' i 'dependencies'-delen av `package.json` og laster ned koden for React-biblioteket til `node_modules`-mappen.

## Hvordan npm og npx fungerer

**npm (Node Package Manager)** er en pakkehåndterer for JavaScript. Den lar deg installere, oppdatere og administrere JavaScript-biblioteker og -verktøy i prosjektet ditt. Når du installerer en pakke med `npm install`, legger den pakken til i `node_modules`-mappen og oppdaterer `package.json`-filen.

**npx** er en pakke som fulgte med npm (fra versjon 5.2.0) som gjør det lettere å kjøre kommandoer fra Node.js-moduler. Den mest kjente bruken av npx er å kjøre `create-react-app` uten å installere det globalt på maskinen.

**Konklusjon**

React er et kraftfullt bibliotek for å bygge brukergrensesnitt. Med verktøy som `create-react-app` og npm, er det enkelt å komme i gang og sette opp et nytt prosjekt. Mens denne guiden gir en introduksjon, er det viktig å fortsette læringen og utforske de mange ressursene og dokumentasjonene som er tilgjengelige.

**Kilder:**

- [Offisiell React Dokumentasjon](https://reactjs.org/)
- [Node.js Dokumentasjon](https://nodejs.org/)

---

# **2. Innføring i `Components` & `Props` i React**

## Komponenter i React

Komponenter er byggesteinene i en React-applikasjon. De lar deg bygge gjenbrukbare UI-deler som kan administrere sin egen tilstand, rendering og hendelseshåndtering.

### Hva er en komponent?

En React-komponent kan tenkes på som en funksjon som tar inn `props` (egenskaper) og returnerer en React-element. Dette elementet beskriver hva som skal vises på skjermen.

### Typer av komponenter

Det er to hovedtyper av komponenter i React:

**1. Funksjonskomponenter**

Dette er den enkleste formen for React-komponenter.

```javascript
const Welcome = () => {
  return <h1>Hei, Petter</h1>;
}
```

**2. Klassekomponenter**

For mer avansert bruk, spesielt når du vil administrere tilstanden:

```javascript
class Welcome extends React.Component {
  render() {
    return <h1>Hei, Petter</h1>;
  }
}
```


### Sammenslåtte komponenter

For å bygge en fullverdig React-applikasjon, vil komponenter ofte bli 'sammenslått' ved å inkludere andre komponenter i deres utdata. Dette gir muligheten til å bygge komplekse UIer fra små, gjenbrukbare deler.

```javascript
const App = () => {
  return (
    <div>
      <Welcome />
      <Welcome />
      <Counter />
    </div>
  );
}
```

**Konklusjon**

Komponenter er kjernen i React. De gir et modulært og gjenbrukbart system for å bygge moderne webapplikasjoner. Ved å kombinere komponenter med `props`, `state`, og livssyklusmetoder, kan React-utviklere bygge kraftige og fleksible brukergrensesnitt.

## Props i React

I React representerer 'props' en måte å sende data fra en foreldrekomponent til en barnekomponent. De lar deg parameterisere komponenter, akkurat som du ville gjort med en ren JavaScript-funksjon.

### Hva er Props?

'Props' er en forkortelse for 'properties'. I essens er de spesielle objekter som holder informasjonen du sender fra en foreldrekomponent til en barnekomponent. De lar barnet 'kjenne' til data som det ellers ikke ville hatt tilgang til.

### Hvordan bruke Props?

For å sende props fra en foreldre til en barnekomponent, angir du dem som attributter på barnekomponenten:

```javascript
const Welcome = (props) => {
  return <h1>Hei, {props.name}</h1>;
};

<Welcome name='Anna' />
```

I eksempelet ovenfor sender vi en prop kalt `name` med verdien 'Anna' til `Welcome`-komponenten.

### Props er Read-Only

Det er viktig å forstå at du aldri bør endre `props` inne i en komponent. De er ment å være read-only. Hvis du trenger å endre data basert på en prop, bør du bruke `state`.

### Bruke Props i Klassekomponenter

I klassekomponenter, blir props tilgjengelig via `this.props`, men her er en versjon med en funksjonell komponent:

```javascript
const Welcome = (props) => {
  return <h1>Hei, {props.name}</h1>;
}
```

### Fordeler med Props

- **Modularitet:** Gjør det enkelt å gjenbruke komponenter i forskjellige kontekster.
- **Lesbarhet:** Klart å se hvilke data en komponent avhenger av.
- **Pålitelighet:** Ved å være eksplisitt med hvilke data som sendes som props, kan man unngå potensielle feil.

**Konklusjon**

Props i React gir en kraftig, fleksibel og pålitelig måte å overføre data mellom komponenter. De er en fundamental del av hvordan React-applikasjoner er strukturert og bygget.


**Kilder:**
- [Offisiell React-dokumentasjon for komponenter og props](https://reactjs.org/docs/components-and-props.html)
- [Offisiell React-dokumentasjon for props](https://reactjs.org/docs/components-and-props.html)

# Innføring i React `Hooks: useState`

Reacts `useState` er en av de grunnleggende Hooks som introduserer statshåndtering i funksjonskomponenter.

## Hva er `useState`?

`useState` gir funksjonskomponenter evnen til å ha sin egen interne tilstand, akkurat som `this.state` gjør for klassekomponenter. Før Hooks, kunne bare klassekomponenter ha intern tilstand.

## Hvordan fungerer `useState`?

Når du bruker `useState`, deklarerer du en 'state-variabel'. Den returnerer et par: den nåværende staten og en funksjon som oppdaterer den.

```javascript
const [state, setState] = useState(initialState);
```

- `initialState` er den innledende verdien for staten.
- `state` er den nåværende verdien av staten.
- `setState` er en funksjon som brukes til å oppdatere staten.

**Eksempel:**

La oss lage en enkel komponent som lar brukeren telle opp og ned:

```javascript
import React, { useState } from 'react';

const Counter = () => {
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>Current Count: {count}</p>
      <button onClick={() => setCount(count + 1)}>Increase</button>
      <button onClick={() => setCount(count - 1)}>Decrease</button>
    </div>
  );
};
```

**Forklaring:**

1. **Importere `useState`**: Først må vi importere `useState`-hooken fra 'react'.
2. **Deklarere en state-variabel**: Vi deklarerer en state-variabel kalt `count` med en initiell verdi av `0` ved hjelp av `useState`.
3. **Bruk state-variabelen**: `count` kan nå brukes akkurat som enhver annen variabel. Her vises den i et `<p>`-element.
4. **Oppdater staten**: `setCount` brukes til å endre verdien av `count`. Når knappene klikkes, øker eller minker verdien av `count` tilsvarende.

## Når bør du bruke `useState`?

`useState` er nyttig når du trenger å spore en enkel verdi (eller objekt) i komponenten din. For mer kompleks statshåndtering (f.eks. global tilstand eller business-logikk), kan du vurdere andre løsninger som `useReducer` eller konteksthooks.

**Kilder:**
- [Offisiell React-dokumentasjon for useState](https://reactjs.org/docs/hooks-state.html)

## `prevState` i React

`prevState` er en referanse til komponentens state umiddelbart før `setState` ble kalt.

### Hva er det?

Når du bruker `setState` i en klassekomponent, kan du enten passere inn et objekt som direkte representerer endringene, eller du kan passere inn en funksjon. Denne funksjonen vil få den forrige staten, ofte referert til som `prevState`, som sitt første argument.

### Hvordan bruker man det?

```javascript
this.setState((prevState) => ({
  count: prevState.count + 1
}));
```

### Hvorfor trenger vi det?

Bruken av `prevState` sikrer at staten oppdateres korrekt spesielt når staten oppdatering avhenger av den forrige verdien av staten. Dette er viktig i tilfeller hvor flere `setState` kall kan batch-prosesseres sammen, noe som kan føre til upresise oppdateringer hvis man ikke bruker `prevState`.

### Når bør man bruke det?

- **Avhengig av tidligere state**: Hvis den nye staten avhenger av den tidligere staten, som i en teller.
- **Asynkrone `setState` kall**: Siden `setState` er asynkron, for å unngå potensielle problemer med rasebetingelser.

### Når trenger man ikke å bruke det?

Hvis den nye staten ikke er avhengig av den forrige staten, er det greit å sette staten direkte.
**Eksempel:**

```javascript
this.setState({ username: 'Alice' });
```

## `useState` med arrays og objekter

### Arrays:

Med `useState`, når du jobber med arrays, kan du bruke array-metoder som `push`, `pop`, `filter`, etc., men husk å alltid returnere en ny array istedenfor å modifisere den eksisterende direkte for å følge immutabilitetsprinsippet i React.

```javascript
const [items, setItems] = useState([]);

// Legger til et nytt element
setItems([...items, newItem]);

// Fjerner et element basert på indeks
const removeItemAtIndex = (index) => {
  setItems(items => items.filter((_, i) => i !== index));
};
```

### Objekter:

Når du jobber med objekter, bruker du spredningsoperatøren (`...`) for å lage en kopi av det eksisterende objektet og deretter oppdatere den spesifikke egenskapen.

```javascript
const [user, setUser] = useState({
  name: 'Alice',
  age: 30
});

// Oppdaterer navnet
setUser(prevUser => ({
  ...prevUser,
  name: 'Bob'
}));
```

**Merk**: Det er viktig å huske at `useState` ikke automatisk fletter objekter som `this.setState` gjør i klassekomponenter, så du må sørge for å manuelt kopiere de eksisterende verdiene som vist ovenfor.

**Kilder:**
- [Offisiell React-dokumentasjon for setState](https://reactjs.org/docs/react-component.html#setstate)
- [Offisiell React-dokumentasjon for useState](https://reactjs.org/docs/hooks-state.html)

## State i React: Klassekomponenter vs Funksjonskomponenter

### Klassekomponenter:

Før Hooks ble introdusert, var klassekomponenter den primære måten å håndtere staten i React. 

**Eksempel:**

```javascript
import React, { Component } from 'react';

class Counter extends Component {
  constructor(props) {
    super(props);
    this.state = {
      count: 0
    };
  }

  increaseCount = () => {
    this.setState({ count: this.state.count + 1 });
  }

  decreaseCount = () => {
    this.setState({ count: this.state.count - 1 });
  }

  render() {
    return (
      <div>
        <p>Current Count: {this.state.count}</p>
        <button onClick={this.increaseCount}>Increase</button>
        <button onClick={this.decreaseCount}>Decrease</button>
      </div>
    );
  }
}
```

I klassekomponenter:

1. **Initial State**: Statens innledende verdier er satt i komponentens `constructor`.
2. **setState Metode**: For å oppdatere staten, bruker vi `this.setState()` metoden. Denne metoden tar enten en ny state-objekt eller en funksjon som returnerer et nytt state-objekt, og utløser en re-render av komponenten.

### Funksjonskomponenter med useState:

Med introduksjonen av Hooks kan funksjonskomponenter nå ha sin egen interne tilstand med `useState`.

**Eksempel:**

```javascript
import React, { useState } from 'react';

const Counter = () => {
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>Current Count: {count}</p>
      <button onClick={() => setCount(count + 1)}>Increase</button>
      <button onClick={() => setCount(count - 1)}>Decrease</button>
    </div>
  );
};
```

I funksjonskomponenter med `useState`:

1. **Initial State**: Statens innledende verdier er satt direkte innen `useState`-funksjonen.
2. **Setter Funksjon**: `useState` returnerer en setter-funksjon (i dette tilfellet `setCount`) som kan brukes til å oppdatere staten. Enhver oppdatering av staten ved hjelp av setter-funksjonen utløser også en re-render av komponenten.

### Sammenligning:

- **Syntaks**: Klassekomponenter krever en mer verbose syntaks med en `constructor`, `render` metoden osv. Mens funksjonskomponenter med `useState` gir en mye renere og kortere kodebase.
- **`this` Nøkkelord**: I klassekomponenter må vi forholde oss til `this` nøkkelordet for å få tilgang til staten og funksjoner, noe som kan være forvirrende for nybegynnere. Dette problemet eksisterer ikke i funksjonskomponenter.
- **Gjenbruk**: Custom hooks lar deg gjenbruke logikk mellom funksjonskomponenter, mens med klassekomponenter kan gjenbruk av logikk være mer utfordrende.

I det store og hele, mens klassekomponenter fortsatt er fullt støttet og nyttig i enkelte scenarier, har introduksjonen av Hooks (som `useState`) ført til en sterk forskyvning mot bruk av funksjonskomponenter for mange utviklere, grunnet enklere syntaks og økt gjenbruk av komponentlogikk.

**Kilder:**
- [Offisiell React-dokumentasjon for State og livssyklus](https://reactjs.org/docs/state-and-lifecycle.html)
- [Offisiell React-dokumentasjon for useState](https://reactjs.org/docs/hooks-state.html)

---
