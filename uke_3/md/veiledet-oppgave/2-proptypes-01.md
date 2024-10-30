## Innføring i `PropTypes` & `TypeScript`

### **Oppgave 1: Intro til PropTypes**

**Mål:** Bli kjent med PropTypes for typechecking før vi dykker dypere inn i TypeScript.

**Beskrivelse:**  
Opprett en React-komponent `Profile` som viser grunnleggende brukerinformasjon. Bruk PropTypes for å sikre at `Profile` tar inn følgende props:
- `name`: en streng
- `age`: et nummer
- `experience`: en array av objekter, hvor hvert objekt har en `title` (streng) og `years` (nummer).

**Link:** [PropTypes documentation](https://reactjs.org/docs/typechecking-with-proptypes.html)

**Trinnvis Løsning:**

1. **Opprett en ny React-komponent kalt `Profile`:**  
   Begynn med å opprette en ny fil kalt `Profile.js` i prosjektets komponentmappe. Dette er hvor vi skal skrive vår React-komponent.

2. **Skriv komponenten:**  
   Innenfor `Profile.js`, importer React og PropTypes. Dette er nødvendig for å kunne bruke React og PropTypes i vår komponent.

   <details><summary>Se full kode</summary>
   
   ```javascript
   import React from 'react';
   import PropTypes from 'prop-types';
   ```

   Deretter, opprett `Profile`-komponenten. En komponent i React er en funksjon som returnerer JSX, som er en syntaksutvidelse for JavaScript som ligner på HTML.

   <details><summary>Se full kode</summary>
   
   ```javascript
   const Profile = ({ name, age, experience }) => {
     return (
       <div>
         <h2>{name}</h2>
         <p>Age: {age}</p>
         <ul>
           {experience.map((exp, index) => (
             <li key={index}>
               {exp.title} - {exp.years} years
             </li>
           ))}
         </ul>
       </div>
     );
   };
   ```

   I denne komponenten tar vi inn `name`, `age`, og `experience` som props og viser dem i en enkel HTML-struktur. `experience` er en array, så vi bruker `map`-funksjonen for å iterere over hvert element og vise det i en liste.

3. **Legg til PropTypes:**  
   Under komponenten, definer PropTypes for `Profile`. PropTypes er et bibliotek som lar oss spesifisere hvilke typer props en komponent skal motta. Dette hjelper med å fange feil tidlig i utviklingsprosessen.

   <details><summary>Se full kode</summary>
   
   ```javascript
   Profile.propTypes = {
     name: PropTypes.string.isRequired,
     age: PropTypes.number.isRequired,
     experience: PropTypes.arrayOf(
       PropTypes.shape({
         title: PropTypes.string.isRequired,
         years: PropTypes.number.isRequired,
       })
     ).isRequired,
   };
   ```

   > [!IMPORTANT]  
   > Her spesifiserer vi at `name` skal være en streng, `age` skal være et nummer, og `experience` skal være en array av objekter. Hvert objekt i `experience`-arrayen skal ha en `title` som er en streng og `years` som er et nummer. `isRequired` betyr at disse propsene er obligatoriske.

   Deretter, eksporter `Profile`-komponenten. Dette gjør at vi kan importere og bruke `Profile`-komponenten i andre deler av vår applikasjon.

   <details><summary>Se full kode</summary>
   
   ```javascript
   export default Profile;
   ```

**Forklaring:**

PropTypes gir typekontroll for props som sendes til en React-komponent. Dette bidrar til å fange feil tidligere i utviklingsprosessen. I denne oppgaven, ved å bruke PropTypes, sikrer vi at `Profile`-komponenten mottar riktige typer for `name`, `age` og `experience`. Dette bidrar til å forbedre robustheten og forutsigbarheten av komponenten.

> [!TIP]
> For `experience`, har vi brukt `arrayOf` kombinert med `shape` for å spesifisere at det er en array av objekter, hvor hvert objekt har bestemte nøkler med bestemte typer.

[React PropTypes and type checking](https://reactjs.org/docs/typechecking-with-proptypes.html)  
[PropTypes on GitHub](https://github.com/facebook/prop-types)


### **Oppgave 2: Integrering av TypeScript i et eksisterende React-prosjekt**

**Mål:** Integrer TypeScript i et eksisterende React JS-prosjekt for CV-applikasjonen.

**Beskrivelse:**  
Ta et eksisterende React JS-prosjekt for CV-applikasjonen og integrer TypeScript. Dette innebærer å installere nødvendige avhengigheter, konfigurere tsconfig, og endre noen av de eksisterende React JS-komponentene til TypeScript-komponenter.

**Link:** [Adding TypeScript to an Existing Project](https://www.typescriptlang.org/docs/handbook/migrating-from-javascript.html)

**Trinnvis Løsning:**

1. **Installer TypeScript og nødvendige avhengigheter:**  
   I terminalen, kjør følgende kommandoer. Dette vil installere TypeScript og typer for Node, React, React DOM, og Jest.

   <details><summary>Se full kode</summary>
   
   ```
   npm install --save typescript @types/node @types/react @types/react-dom @types/jest
   ```

2. **Initialiser en TypeScript konfigurasjonsfil:**  
   Kjør følgende kommando. Dette vil opprette en `tsconfig.json` fil i rotkatalogen av prosjektet, som brukes til å konfigurere TypeScript-kompilatoren.

   <details><summary>Se full kode</summary>
   
   ```
   npx tsc --init
   ```

3. **Konfigurer tsconfig for React:**  
   Åpne `tsconfig.json` og gjør følgende endringer. Dette konfigurerer TypeScript til å fungere med React og spesifiserer hvilke filer som skal inkluderes og ekskluderes.

   <details><summary>Se full kode</summary>
   
   ```json
   {
     "compilerOptions": {
       "target": "es5",
       "lib": ["dom", "dom.iterable", "esnext"],
       "allowJs": true,
       "skipLibCheck": true,
       "esModuleInterop": true,
       "allowSyntheticDefaultImports": true,
       "strict": true,
       "forceConsistentCasingInFileNames": true,
       "noFallthroughCasesInSwitch": true,
       "module": "esnext",
       "moduleResolution": "node",
       "resolveJsonModule": true,
       "isolatedModules": true,
       "noEmit": true,
       "jsx": "react-jsx"
     },
     "include": ["src/**/*.ts", "src/**/*.tsx"],
     "exclude": ["node_modules"]
   }
   ```

   > [!NOTE]  
   > Sørg for at `include` og `exclude` feltene er riktig konfigurert for å inkludere alle TypeScript-filer i `src`-mappen og ekskludere `node_modules`.

4. **Endre filendelser fra `.js` til `.tsx` for React-komponenter:**  
   Dette signaliserer til TypeScript kompileren at filene inneholder JSX. JSX er en syntaksutvidelse for JavaScript som ligner på HTML og brukes i React.

5. **Migrer en React-komponent til TypeScript:**  
   Som et eksempel, la oss ta `Profile`-komponenten fra Oppgave 1. Endre filendelsen til `.tsx` og deretter importer `React` som:

   <details><summary>Se full kode</summary>
   
   ```typescript
   import React, { FC } from 'react';
   ```

   Deretter, definer prop-typer for `Profile`. I TypeScript bruker vi grensesnitt (interfaces) for å definere typer for props.

   <details><summary>Se full kode</summary>
   
   ```typescript
   interface ProfileProps {
     name: string;
     age: number;
     experience: {
       title: string;
       years: number;
     }[];
   }

   const Profile: FC<ProfileProps> = ({ name, age, experience }) => {
     return (
       <div>
         <h2>{name}</h2>
         <p>Age: {age}</p>
         <ul>
           {experience.map((exp, index) => (
             <li key={index}>
               {exp.title} - {exp.years} years
             </li>
           ))}
         </ul>
       </div>
     );
   };

   export default Profile;
   ```

**Forklaring:**

Å legge til TypeScript i et eksisterende React JS-prosjekt gir sterkere type sikkerhet og kan forbedre kodekvaliteten. Den første delen av denne oppgaven fokuserer på oppsett og installasjon av nødvendige avhengigheter. `tsconfig.json` konfigurerer hvordan TypeScript kompileren skal fungere. 

> [!CAUTION]
> Sørg for å teste applikasjonen grundig etter å ha migrert til TypeScript for å sikre at ingen funksjonalitet er brutt.

De siste trinnene demonstrerer en enkel migrasjon av en React-komponent til TypeScript ved å bruke grensesnitt for props og `FC` (Functional Component) fra `React`.

[Adding TypeScript to an Existing Project](https://www.typescriptlang.org/docs/handbook/migrating-from-javascript.html)  
[TypeScript and React](https://fettblog.eu/typescript-react/)

### **Oppgave 3: Feilsøking i React-komponenter**

**Mål:** Forbedre feilsøkingsferdigheter ved å identifisere og rette feil i React-komponenter.

**Beskrivelse:**  
I denne oppgaven skal du finne og rette feil i en gitt React-komponent. Koden nedenfor er ment å vise en liste over brukere med navn og alder, men den inneholder en feil som forhindrer riktig visning. Din oppgave er å finne og rette feilen.

**Link:** [React Documentation](https://reactjs.org/docs/getting-started.html)

**Kode:**

<details><summary>Se full kode</summary>

```javascript
import React from 'react';

const UserList = ({ users }) => {
  return (
    <div>
      <h1>User List</h1>
      <ul>
        {users.map(user => (
          <li key={user.id}>
            {user.name} - {user.age} years old
          </li>
        ))}
      </ul>
    </div>
  );
};

UserList.propTypes = {
  users: PropTypes.arrayOf(
    PropTypes.shape({
      id: PropTypes.number.isRequired,
      name: PropTypes.string.isRequired,
      age: PropTypes.number.isRequired,
    })
  ).isRequired,
};

export default UserList;
```

**Forklaring:**

Koden ovenfor skal vise en liste over brukere med navn og alder. Hver bruker har en unik `id`, et `name`, og en `age`. Komponentens props er typekontrollert med PropTypes for å sikre at `users` er en array av objekter med de nødvendige feltene.

**Løsningsforslag:**

Feilen i koden er at `PropTypes` ikke er importert, noe som vil føre til en feil når komponenten prøver å bruke `PropTypes` for typekontroll. For å rette feilen, må vi importere `PropTypes` fra `prop-types`-biblioteket.

<details><summary>Se full kode</summary>

```javascript
import React from 'react';
import PropTypes from 'prop-types';

const UserList = ({ users }) => {
  return (
    <div>
      <h1>User List</h1>
      <ul>
        {users.map(user => (
          <li key={user.id}>
            {user.name} - {user.age} years old
          </li>
        ))}
      </ul>
    </div>
  );
};

UserList.propTypes = {
  users: PropTypes.arrayOf(
    PropTypes.shape({
      id: PropTypes.number.isRequired,
      name: PropTypes.string.isRequired,
      age: PropTypes.number.isRequired,
    })
  ).isRequired,
};

export default UserList;
```

Ved å legge til `import PropTypes from 'prop-types';` øverst i filen, sikrer vi at `PropTypes` er tilgjengelig for komponenten, og typekontrollen vil fungere som forventet.
