## Oppgavesett: Interaktiv Online CV Webapplikasjon: `Redux Toolkit`

### **Introduksjon:**

Redux Toolkit er den offisielle, opinionated, batteri-inkluderte verktøykassen for Redux. Den lar deg skrive Redux-logikk med færre kodelinjer, og det blir enklere å forholde seg til. I disse oppgavene vil vi videreutvikle vår 'Interaktiv Online CV Webapplikasjon' ved å inkorporere Redux Toolkit.

### **Oppgave 1: Installer Redux Toolkit**

**Instrukser:**

1. Åpne ditt eksisterende prosjekt i terminalen.
2. Installer Redux Toolkit ved å kjøre kommandoen: 

```bash
npm install @reduxjs/toolkit react-redux
```

> [!IMPORTANT]  
> Sørg for at du har en fungerende internettforbindelse når du kjører installasjonskommandoen.

**Begrunnelse:**

Redux Toolkit er et bibliotek som hjelper deg med å håndtere tilstanden i din applikasjon på en enklere og mer strukturert måte. `react-redux` er et bindingsbibliotek som lar deg bruke Redux sammen med React.

### **Oppgave 2: Sett opp Redux Store med `configureStore`**

**Instrukser:**

1. I `store.js`, bruk `configureStore` fra Redux Toolkit for å opprette en Redux store.
2. Definer en `rootReducer` som kombinerer alle dine reducere (du kan bruke `combineReducers` fra `redux` hvis nødvendig).

> [!TIP]
> Redux Toolkit inneholder `combineReducers` innebygd i `configureStore`, så du trenger ikke å importere den separat!

<details><summary>Løsning</summary>

**Eksempel:**

```javascript
import { configureStore } from '@reduxjs/toolkit';
// Importer dine reducere her...

const store = configureStore({
  reducer: {
    // Dine reducer oppføringer her...
  }
});

export default store;
```

**Begrunnelse:**

En Redux store er en sentral del av Redux-arkitekturen. Den holder hele tilstanden til applikasjonen din. `configureStore` er en funksjon fra Redux Toolkit som gjør det enklere å sette opp en store med fornuftige standardinnstillinger.

</details>

### **Oppgave 3: Lag en Slice for Erfaringer**

**Instrukser:**

1. Bruk `createSlice` fra Redux Toolkit for å lage en slice for `experiences`.
2. Definer tilstanden, reducerne, og handlingene i samme fil.
3. Eksporter de nødvendige handlingene og reducere.

> [!NOTE]  
> `createSlice` vil generere action creators for deg automatisk!

<details><summary>Løsning</summary>

```javascript
import { createSlice } from '@reduxjs/toolkit';

const experiencesSlice = createSlice({
  name: 'experiences',
  initialState: [],
  reducers: {
    addExperience: (state, action) => {
      state.push(action.payload);
    },
    removeExperience: (state, action) => {
      return state.filter(exp => exp.id !== action.payload.id);
    }
  }
});

export const { addExperience, removeExperience } = experiencesSlice.actions;

export default experiencesSlice.reducer;
```


**Begrunnelse:**

En slice i Redux Toolkit er en samling av Redux-logikk for en bestemt del av tilstanden. `createSlice` er en funksjon som lar deg definere initial tilstand, reducer-funksjoner, og action creators på en enkel måte. Dette gjør koden din mer lesbar og vedlikeholdbar.

</details>

### **Oppgave 4: Bruk `useDispatch` og `useSelector` fra Redux Toolkit**

**Instrukser:**

1. Oppdater `ExperienceList` komponenten for å bruke `useDispatch` og `useSelector` fra `react-redux`.
2. Erstatt alle `mapStateToProps` og `mapDispatchToProps` logikken med de nevnte hooks.

<details><summary>Løsning</summary>

```javascript
import { useDispatch, useSelector } from 'react-redux';
import { addExperience, removeExperience } from './path-to-experiencesSlice';

const ExperienceList = () => {
  const experiences = useSelector((state) => state.experiences);
  const dispatch = useDispatch();

  const handleAdd = (experience) => {
    dispatch(addExperience(experience));
  }

  const handleRemove = (id) => {
    dispatch(removeExperience({ id }));
  }

  // Render logikk for listen her...
}
```

**Begrunnelse:**

`useSelector` er en hook som lar deg hente tilstanden fra Redux store i en funksjonell komponent. `useDispatch` er en hook som lar deg sende handlinger til Redux store. Disse hookene erstatter behovet for `mapStateToProps` og `mapDispatchToProps`, og gjør koden din mer konsis og enklere å lese.

</details>

### **Oppgave 5: Feilsøking i Redux Toolkit**

**Introduksjon:**

I denne oppgaven skal du feilsøke en kode som inneholder en feil. Koden nedenfor er ment å legge til og fjerne erfaringer fra en liste. Din oppgave er å finne og rette feilen.

**Instrukser:**

1. Les gjennom koden nedenfor.
2. Identifiser feilen som forhindrer koden fra å fungere som forventet.
3. Rett feilen og forklar hva som var galt.

**Kodeeksempel:**


```javascript
import { createSlice } from '@reduxjs/toolkit';

const experiencesSlice = createSlice({
  name: 'experiences',
  initialState: [],
  reducers: {
    addExperience: (state, action) => {
      state.push(action.payload);
    },
    removeExperience: (state, action) => {
      return state.filter(exp => exp.id === action.payload.id);
    }
  }
});

export const { addExperience, removeExperience } = experiencesSlice.actions;

export default experiencesSlice.reducer;
```

<details><summary>Løsning</summary>

**Feil:**

Feilen i koden er i `removeExperience`-reduceren. Den nåværende implementeringen filtrerer ut elementer som har samme `id` som `action.payload.id`, men den burde filtrere ut elementer som har en annen `id` enn `action.payload.id`.

**Rettet kode:**

```javascript
import { createSlice } from '@reduxjs/toolkit';

const experiencesSlice = createSlice({
  name: 'experiences',
  initialState: [],
  reducers: {
    addExperience: (state, action) => {
      state.push(action.payload);
    },
    removeExperience: (state, action) => {
      return state.filter(exp => exp.id !== action.payload.id);
    }
  }
});

export const { addExperience, removeExperience } = experiencesSlice.actions;

export default experiencesSlice.reducer;
```

**Forklaring:**

Den opprinnelige `removeExperience`-reduceren filtrerte ut elementer som hadde samme `id` som `action.payload.id`, noe som resulterte i at ingen elementer ble fjernet fra listen. Ved å endre betingelsen til `exp.id !== action.payload.id`, fjernes elementet med den spesifikke `id` fra listen, som forventet.

</details>