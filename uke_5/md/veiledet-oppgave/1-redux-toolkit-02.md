### **Oppgave 5: Implementer asynkron logikk med `createAsyncThunk`**

**Instrukser:**

1. Bruk `createAsyncThunk` fra Redux Toolkit for å håndtere asynkron logikk (som f.eks. API-kall).
2. Legg til ekstra reducers for de ulike stadiene av asynkrone handlinger: `pending`, `fulfilled`, og `rejected`.

**Tips:** 
`createAsyncThunk` håndterer automatisk de forskjellige fasene av asynkrone handlinger for deg!

<details><summary>Løsning</summary>

```javascript
import { createSlice, createAsyncThunk } from '@reduxjs/toolkit';

export const fetchExperiences = createAsyncThunk(
  'experiences/fetchExperiences',
  async () => {
    const response = await fetch('API_URL_HERE');
    const data = await response.json();
    return data;
  }
);

const experiencesSlice = createSlice({
  name: 'experiences',
  initialState: [],
  reducers: {},
  extraReducers: builder => {
    builder
      .addCase(fetchExperiences.fulfilled, (state, action) => {
        return action.payload;
      })
  }
});

export default experiencesSlice.reducer;
```

</details>

### **Oppgave 6 (Valgfri): Introduksjon til `RTK Query`**

**Instrukser:**

1. Utforsk RTK Query, en kraftig datahentings- og caching-mekanisme innebygd i Redux Toolkit.
2. Implementer en funksjonalitet i CV-appen som henter data fra en API ved hjelp av RTK Query.

**Tips:** 
Det anbefales å lese [offisiell dokumentasjon](https://redux-toolkit.js.org/rtk-query/overview) før du starter.

> Når du er ferdig med oppgavene, kan du prøve å utforske mer av funksjonene som Redux Toolkit tilbyr. Toolkit er designet for å gjøre Redux enklere og mer effektivt, så det er definitivt verdt å dykke dypere inn i det!

<details><summary>Løsning</summary>

Denne oppgaven er mer av en utforskende natur. Det beste vil være å følge [offisiell dokumentasjon](https://redux-toolkit.js.org/rtk-query/overview) for å implementere RTK Query.

#### **Utforskende Eksempler med RTK Query**

#### **1. Definere en API Slice for Erfaringer:**

Med RTK Query, kan du definere en API slice ved hjelp av `createApi` som vil håndtere alle CRUD-operasjonene for dine erfaringer.

```javascript
import { createApi, fetchBaseQuery } from '@reduxjs/toolkit/query/react';

export const api = createApi({
  baseQuery: fetchBaseQuery({ baseUrl: '/api' }),
  endpoints: (builder) => ({
    getExperiences: builder.query({
      query: () => 'experiences'
    }),
    addExperience: builder.mutation({
      query: (newExperience) => ({
        url: 'experiences',
        method: 'POST',
        body: newExperience
      })
    })
  })
});

export const { useGetExperiencesQuery, useAddExperienceMutation } = api;
```

#### **2. Hent Erfaringer i en Komponent:**

Bruk den genererte hook `useGetExperiencesQuery` for å hente erfaringene.

```javascript
import { useGetExperiencesQuery } from './apiSlice';

const ExperienceList = () => {
  const { data: experiences, isLoading, isError } = useGetExperiencesQuery();

  if (isLoading) return <div>Loading...</div>;
  if (isError) return <div>Error loading experiences</div>;

  // Render logikk for listen her...
}
```

#### **3. Legg til en ny Erfaring:**

Bruk den genererte mutation hook `useAddExperienceMutation` for å legge til en ny erfaring.

```javascript
import { useAddExperienceMutation } from './apiSlice';

const AddExperienceForm = () => {
  const [addExperience] = useAddExperienceMutation();

  const handleSubmit = (newExperience) => {
    addExperience(newExperience);
  }

  // Render form logikk her...
}
```

Disse eksemplene gir en enkel introduksjon til hvordan RTK Query kan brukes i sammenheng med prosjektet ditt. For en dypere forståelse og ytterligere funksjoner (som oppdatering, sletting, caching, osv.), sjekk [offisiell RTK Query dokumentasjon](https://redux-toolkit.js.org/rtk-query/overview).

</details>

**Kilder**:
- [Redux Toolkit Official Documentation](https://redux-toolkit.js.org/)