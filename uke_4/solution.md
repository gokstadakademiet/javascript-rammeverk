# Uke 4

## `React router dom`: Løsning og Forklaring:

### **Løsningsforslag Oppgave 1: Sette opp react-router-dom**

**Løsning:** 

For å starte, installer `react-router-dom` via npm:

```bash
npm install react-router-dom@6
```

Opprett en grunnleggende ruting:

```javascript
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';

const App = () => {
  return (
    <Router>
      <Routes>
        <Route path='/' element={<HomePage />} />
        <Route path='/cv' element={<CvPage />} />
      </Routes>
    </Router>
  );
}
```

**Forklaring:**  
Vi har installert `react-router-dom` v6 og satt opp ruter for både hjemmesiden og CV-siden ved hjelp av `<Router>`, `<Routes>` og `<Route>` komponentene.

### **Løsningsforslag Oppgave 2: Navigasjon mellom sider**

**Løsning:** 

Bruk `Link` og `NavLink` for å lage en enkel navigasjon:

```javascript
import { Link, NavLink } from 'react-router-dom';

const Navigation = () => {
  return (
    <nav>
      <Link to='/'>Home</Link>
      <NavLink to='/cv' activeClassName='active'>Detailed CV</NavLink>
    </nav>
  );
}
```

**Forklaring:**  
`Link` og `NavLink` blir brukt for navigasjon. Forskjellen er at `NavLink` gir mulighet for å style den aktive lenken ved hjelp av `activeClassName` eller `activeStyle`.

### **Løsningsforslag Oppgave 3: Nested Routes**

**Løsning:** 

```javascript
const CvPage = () => {
  return (
    <div>
      <Routes>
        <Route path='/' element={<Overview />} />
        <Route path='experience' element={<Experience />} />
        <Route path='education' element={<Education />} />
        <Route path='skills' element={<Skills />} />
      </Routes>
    </div>
  );
}
```

**Forklaring:**  
Ved hjelp av nested ruting, kan vi vise forskjellige deler av CV-en basert på den valgte stien.

### **Løsningsforslag Oppgave 4: Bruk av useParams**

**Løsning:** 

```javascript
import { useParams } from 'react-router-dom';

const JobDetail = () => {
  let { id } = useParams();
  // Finn jobberfaringen basert på ID og vis detaljene.
}
```

**Forklaring:**  
Med `useParams`, kan vi hente ut parametre fra URLen, som for eksempel IDen til en jobberfaring.

### **Løsningsforslag Oppgave 5: Redirects og Navigation Guards**

**Løsning:** 

Bruk `useNavigate` for omdirigering:

```javascript
import { Routes, Route, Outlet, useNavigate } from 'react-router-dom';

const CvPage = () => {
  let navigate = useNavigate();
  let loggedIn = // sjekk om brukeren er logget inn
  
  if (!loggedIn) {
    navigate('/login');
  }

  return <Outlet />;
}
```

**Forklaring:**  
Hvis brukeren ikke er logget inn, vil de bli omdirigert til innloggingssiden ved hjelp av `useNavigate`.

### **Løsningsforslag Oppgave 6: 404 NotFound Side**

**Løsning:** 

```javascript
const App = () => {
  return (
    <Router>
      <Routes>
        <Route path='/' element={<HomePage />} />
        <Route path='/cv' element={<CvPage />} />
        <Route path='*' element={<NotFound />} />
      </Routes>
    </Router>
  );
}
```

**Forklaring:**  
Ved hjelp av en sti på `*`, vil hvilken som helst rute som ikke allerede er definert, matche `NotFound` komponenten.

## Ekstra utfordringsoppgaver:

### **Løsningsforslag Oppgave 7: Bruk av useLocation**

**Løsning:** 

```javascript
import { useLocation } from 'react-router-dom';

const Breadcrumbs = () => {
  let location = useLocation();
  // Kode for å vise breadcrumbs basert på den gjeldende plasseringen.
}
```

**Forklaring:**  
Med `useLocation`, kan vi få informasjon om den gjeldende plasseringen og bygge en breadcrumb-navigasjon basert på dette.

Husk at disse løsningsforslagene er grunnleggende eksempler. Du kan utvide og tilpasse dem basert på spesifikke krav eller forbedringer du ønsker å implementere i applikasjonen din.


## `Hooks: useContext`: Løsning og Forklaring:

### **Løsningsforslag for Oppgave 1: Grunnleggende om Context**

```javascript
import React, { createContext, useState } from 'react';

const ThemeContext = createContext();

const ThemeProvider = ({ children }) => {
  const [theme, setTheme] = useState('light');

  const toggleTheme = () => {
    setTheme((prevTheme) => (prevTheme === 'light' ? 'dark' : 'light'));
  };

  return (
    <ThemeContext.Provider value={{ theme, toggleTheme }}>
      {children}
    </ThemeContext.Provider>
  );
};

export { ThemeContext, ThemeProvider };
```

**Forklaring:**
Dette mønsteret lar deg opprette en global tilstand som kan være tilgjengelig i hvilken som helst komponent i applikasjonen ved hjelp av React Context. Ved å bruke `ThemeProvider` rundt hele appen din kan alle barna ha tilgang til temaet og funksjonaliteten for å bytte tema.

### **Løsningsforslag for Oppgave 2: Bruk av `useContext`**

```javascript
import React, { useContext } from 'react';
import { ThemeContext } from './ThemeContext';

const ThemeToggleButton = () => {
  const { theme, toggleTheme } = useContext(ThemeContext);

  return <button onClick={toggleTheme}>{theme === 'light' ? 'Dark' : 'Light'} Mode</button>;
};
```

**Forklaring:**
Dette viser hvordan du enkelt kan konsumere verdier fra en Context i en funksjonskomponent ved hjelp av `useContext` hook.

### **Løsningsforslag for Oppgave 3: Deling av state med Context**

```javascript
import React, { createContext, useState } from 'react';

const UserContext = createContext();

const UserProvider = ({ children }) => {
  const [user, setUser] = useState({ name: 'John Doe', profileImage: 'url_to_image' });

  return <UserContext.Provider value={user}>{children}</UserContext.Provider>;
};

const UserProfile = () => {
  const user = useContext(UserContext);
  
  return (
    <div>
      <img src={user.profileImage} alt='User Profile' />
      <p>{user.name}</p>
    </div>
  );
};
```

**Forklaring:**
På samme måte som temaeksemplet, demonstrerer dette hvordan du kan opprette en global tilstand for brukerdata som kan være tilgjengelig for alle komponentene i applikasjonen.

### **Løsningsforslag for Oppgave 4: Optimalisering av Context-renders**

**Tips:**
1. **Bruk `React.memo`:** Dette vil forhindre en komponent i å re-rendre med mindre dens props endrer seg.
2. **Unngå å opprette nye objekter i render:** Bruk `useMemo` for å memoisere objektverdier slik at de ikke blir opprettet på nytt hver gang komponenten rendres.
3. **Splitte Contexts:** Hvis en Context har mange verdier, kan det være effektivt å splitte det opp i mindre Contexts.

**Forklaring:**
Rådene her er fokusert på optimalisering for å sikre at komponenter som konsumerer Contexts ikke blir re-rendret unødvendig, noe som kan påvirke ytelsen i en React-applikasjon.

### **Løsningsforslag for Oppgave 5: Context med andre hooks**

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

### **Løsningsforslag for Oppgave 6: Nested Contexts**

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

### **Løsningsforslag for Oppgave 7: Testing med Context**

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

### **Løsningsforslag for Oppgave 8: Dynamiske Contexts**

**Forklaring:**
I noen tilfeller, som for internasjonalisering, kan du trenge mer dynamiske Contexts. Biblioteker som `react-intl` eller `i18next` kan hjelpe med å opprette en dynamisk kontekst som håndterer ulike språk.

### **Løsningsforslag for Oppgave 9: Bruk av `useReducer` med Context**

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

---
