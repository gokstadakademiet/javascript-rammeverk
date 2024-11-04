### **Oppgave 5: Context med andre hooks**
**Mål:** Forstå hvordan `useContext` kan kombineres med andre hooks for å lage kraftfulle løsninger.
**Beskrivelse:**  
Bygg videre på oppgave 1 og 2 ved å legge til en funksjon i `ThemeContext` som lar deg lagre brukerens temapreferanse i lokal lagring ved hjelp av `useEffect`. Hver gang temaet endres, skal denne preferansen lagres.  

<details><summary>Løsning</summary> 

```javascript
import React, { useState, useEffect, useContext } from 'react';
import { ThemeContext, ThemeProvider } from './ThemeContext';

const App = () => {
  const { theme } = useContext(ThemeContext);

  useEffect(() => {
    localStorage.setItem('preferred-theme', theme);
  }, [theme]);

  return <div className={theme}>{/* Rest of your app components */}</div>;
};
```

**Forklaring:**
Dette eksemplet viser hvordan du kan kombinere flere React-hooks for å oppnå en mer kompleks funksjonalitet. Her blir brukerens valg av tema lagret i nettleserens `localStorage` slik at valget huskes selv etter at siden lastes på nytt.

</details>

**Link:** [Using the Effect Hook](https://reactjs.org/docs/hooks-effect.html)

### **Oppgave 6: Nested Contexts**
**Mål:** Utforsk hvordan forskjellige kontekster kan nestes for å tilby ulike lag av data.
**Beskrivelse:**  
Tenk deg at du har både `ThemeContext` og `UserContext` fra de tidligere oppgavene. Bygg en komponentstruktur som bruker begge kontekster, og se hvordan data fra begge kan hentes i en enkelt komponent.   

<details><summary>Løsning</summary> 

```javascript
import { ThemeProvider } from './ThemeContext';
import { UserProvider } from './UserContext';

const App = () => (
  <ThemeProvider>
    <UserProvider>
      {/* Rest of your app components */}
    </UserProvider>
  </ThemeProvider>
);
```

**Forklaring:**
Dette mønsteret er nyttig når du har flere globale tilstander (f.eks. tema, brukerdata) som du vil gjøre tilgjengelig for hele applikasjonen. Ved å nøste Providers kan underliggende komponenter konsumere verdier fra alle tilgjengelige Contexts.

</details>

**Link:** [React Context](https://reactjs.org/docs/context.html)

### **Oppgave 7: Testing med Context**
**Mål:** Lær hvordan du kan teste komponenter som bruker Context.
**Beskrivelse:**  
Skriv tester for `UserProfile`-komponenten fra Oppgave 3 ved å bruke `jest` og `@testing-library/react`. Lær hvordan du kan 'mock' `UserContext` for å levere falske data under testing.

<details><summary>Løsning</summary> 

```javascript
import { render } from '@testing-library/react';
import { UserContext, UserProfile } from './UserContext';

test('renders user profile', () => {
  const user = { name: 'John Doe', profileImage: 'url_to_image' };

  const { getByText, getByAltText } = render(
    <UserContext.Provider value={user}>
      <UserProfile />
    </UserContext.Provider>
  );

  expect(getByText('John Doe')).toBeInTheDocument();
  expect(getByAltText('User Profile')).toBeInTheDocument();
});
```

**Forklaring:**
Dette eksemplet viser hvordan du kan gjøre 'mocking' av Context ved å bruke den faktiske `Provider` i testen, og sende inn mockede verdier for testing.

</details>

**Link:** [Testing React Components that use Context](https://kentcdodds.com/blog/how-to-test-custom-react-hooks)

## Ekstra utfordringsoppgaver:

### **Oppgave 8: Dynamiske Contexts**
**Mål:** Dykk dypere inn i hvordan du kan lage dynamiske kontekster.
**Beskrivelse:**  
Lag en kontekst som kan bytte språk for din applikasjon (for eksempel norsk, engelsk). Bygg en knapp som lar brukeren bytte mellom disse språkene, og vis teksten på applikasjonen i valgt språk. 

<details><summary>Løsning</summary> 

**Forklaring:**
I noen tilfeller, som for internasjonalisering, kan du trenge mer dynamiske Contexts. Biblioteker som `react-intl` eller `i18next` kan hjelpe med å opprette en dynamisk kontekst som håndterer ulike språk.

</details>

### **Oppgave 9: Bruk av `useReducer` med Context**
**Mål:** Se hvordan `useReducer` kan kombineres med `useContext` for kompleks statshåndtering.
**Beskrivelse:**  
Implementer en handlekurvfunksjon for en e-handelsapplikasjon ved å bruke `useReducer` sammen med en `CartContext`. Dette skal tillate å legge til produkter, fjerne produkter og tømme handlekurven.   

<details><summary>Løsning</summary> 

```javascript
import React, { createContext, useReducer } from 'react';

const CartContext = createContext();

const cartReducer = (state, action) => {
  switch (action.type) {
    case 'ADD_ITEM':
      return [...state, action.item];
    case 'REMOVE_ITEM':
      return state.filter((item) => item.id !== action.id);
    default:
      return state;
  }
};

const CartProvider = ({ children }) => {
  const [cart, dispatch] = useReducer(cartReducer, []);

  return <CartContext.Provider value={{ cart, dispatch }}>{children}</CartContext.Provider>;
};
```

**Forklaring:**
`useReducer` er en nyttig hook for komplekse tilstandshåndteringsscenarier, hvor du har mange relaterte handlinger som kan påvirke tilstanden. Ved å kombinere `useReducer` med Context kan du opprette en global tilstandshåndteringsløsning som ligner på Redux.

</details>

**Link:** [Hooks API Reference - useReducer](https://reactjs.org/docs/hooks-reference.html#usereducer)
