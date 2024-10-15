# Uke 4

## Innføring i `React Router Dom`

React Router er en sentral rutingløsning for React som gjør det mulig å bygge enkelt-side applikasjoner med navigasjon. Versjon 6 av React Router Dom introduserer flere nyheter og endringer.

### Installasjon og Setup

For å installere React Router:

```bash
npm install react-router-dom
```

### Grunnleggende ruting

Her er hvordan du setter opp en enkel ruting med React Router v6:

```javascript
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';

const App = () => {
  return (
    <Router>
      <Routes>
        <Route path='/' element={<Home />} />
        <Route path='/about' element={<About />} />
      </Routes>
    </Router>
  );
}
```

### Link-komponenten

For å navigere mellom sider:

```javascript
import { Link } from 'react-router-dom';

const Navigation = () => {
  return (
    <nav>
      <ul>
        <li><Link to='/'>Hjem</Link></li>
        <li><Link to='/about'>Om</Link></li>
      </ul>
    </nav>
  );
}
```

### Forbedringer fra `v5` til `v6`

- **Routes som barn**: I stedet for å bruke Switch og Route som i v5, bruker v6 Routes med barn som Route.
- **Element-prop**: Route tar nå en element prop med det aktuelle React-elementet, i stedet for component eller render props.
- **Nestede ruter**: Det er nå enklere å opprette nestede ruter med den nye Outlet-komponenten.
- **Relative ruter**: Du kan nå definere relative ruter innenfor en nested Route.

#### Nestede ruter med Outlet

Med v6, kan du enkelt opprette nestede ruter ved å bruke Outlet komponenten:

```javascript
import { Routes, Route, Outlet } from 'react-router-dom';

const Users = () => {
  return (
    <div>
      <h2>Users</h2>
      <Outlet />
    </div>
  );
}

const App = () => {
  return (
    <Router>
      <Routes>
        <Route path='users' element={<Users />}>
          <Route path=':id' element={<UserProfile />} />
        </Route>
      </Routes>
    </Router>
  );
}
```

### `useNavigation` og `useLocation` i React Router v6

I tidligere versjoner av React Router (før v6), var `useHistory` hooket en populær måte å få tilgang til navigasjonshistorikken på. Men med v6, har denne blitt fjernet til fordel for `useNavigation`.

#### `useNavigation`

Dette hooket gir deg tilgang til navigasjonsfunksjonene, slik at du kan programmere navigasjon i applikasjonen din:

```javascript
import { useNavigation } from 'react-router-dom';

const NavigateButton = () => {
  let navigate = useNavigation();
  return (
    <button onClick={() => navigate('/about')}>
      Gå til About-side
    </button>
  );
};
```

#### `useLocation`

`useLocation` forblir stort sett det samme i v6. Det gir deg tilgang til det nåværende `location`-objektet, som representerer hvor applikasjonen er akkurat nå:

```javascript
import { useLocation } from 'react-router-dom';

const CurrentPage = () => {
  let location = useLocation();
  return <div>Du er nå på {location.pathname}</div>;
};
```

### **Kilder:**

- [React Router Documentation](https://reactrouter.com/docs/en/v6/)

---







## Innføring i React Hooks:`useContext`

### Hva er `useContext`?

`useContext` er en av de innebygde Hooks i React som tillater deg å bruke kontekst uten å omslutte komponenten din med en Context Consumer. Kontekst gir en måte å dele verdier som disse mellom komponenter uten å måtte eksplisitt sende en prop gjennom hver nivå av treet. Dette er nyttig spesielt når vi har 'global' data som autentisering, tema, eller data cache.

### Hvordan fungerer det?

Teknisk sett, når en komponent (som vi kaller 'Provider') tilbyr en kontekstverdi, alle dens barnekomponenter, og barnas barn, og så videre, kan få tilgang til denne verdien uten at verdien må være passert ned manuelt gjennom props.

Dette fungerer ved at React bruker en spesiell intern mekanisme for å 'bære' kontekstverdien gjennom komponenttreet, og med `useContext`-hooken, kan vi 'hente ut' denne verdien i enhver funksjonskomponent.

### Hvordan bruker vi det?

1. **Opprette kontekst**: Først, oppretter du en kontekst med `createContext`-metoden, som returnerer en kontekstobjekt.

    ```javascript
    const MyContext = React.createContext(defaultValue);
    ```

    `defaultValue` er verdien som blir brukt når en komponent ikke har en matchende Provider ovenfor i treet.

2. **Tilby verdien med Provider**: For å gjøre en kontekstverdi tilgjengelig til en del av komponentene, må du bruke `Provider` komponent som kommer med kontekstobjektet du har opprettet.

    ```javascript
    <MyContext.Provider value={/* some value */}>
        <MyChildComponent />
    </MyContext.Provider>
    ```

3. **Bruk kontekstverdien**: I hvilken som helst barnekomponent (eller dypere ned i treet), kan du nå bruke `useContext`-hooken for å hente ut kontekstverdien.

    ```javascript
    const value = useContext(MyContext);
    ```

### Tips for nybegynnere

- **Ikke overbruk**: Selv om kontekst er kraftig, bør du unngå å bruke det for ofte. Overdreven bruk kan føre til unødvendig kompleksitet i applikasjonen din. Bruk det for global tilstand som tema, autentisering, etc.
- **Kjenne dine alternativer**: Det er også andre metoder for global tilstandshåndtering i React som Redux, MobX, eller Zustand. Du trenger ikke alltid å bruke kontekst, men det er viktig å vite når det er det beste verktøyet for jobben.

Med dette som bakgrunn, la oss nå dykke dypere inn i hvordan vi kan bruke `useContext` for forskjellige scenarier i våre oppgaver.

---
