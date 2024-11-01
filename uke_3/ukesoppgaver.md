# Oppgavesett: Interaktiv Online CV Webapplikasjon: Debugging & Testing
## Innføring i `Jest` og `Debugging` teknikker

### **Oppgave 1: Basic Logging**

**Mål:** Introduser logging for å spore hendelser i applikasjonen.

**Beskrivelse:**  
Introduser `console.log()`-utsagn i CV-applikasjonen din for å spore verdien av variabler på viktige tidspunkter, for eksempel når brukeren legger til eller sletter en erfaring eller ferdighet. 
 
**Eksempel:** Når en bruker prøver å legge til en ny ferdighet i CV-en sin, logger du tidspunktet og selve ferdigheten for å bekrefte at den blir lagt til som forventet.  

[Se et eksempel her](https://developer.mozilla.org/en-US/docs/Web/API/Console/log)

<details><summary>Løsning</summary>

For å introdusere logging, kan du bruke `console.log()` på strategiske steder i koden:


```javascript
const addSkill = (skill) => {
  console.log('Adding skill at:', new Date());
  console.log('Skill:', skill);
  // Resten av koden som legger til ferdigheten
}
```

**Forklaring:** 
Ved å logge tidspunktet og ferdigheten, kan vi bekrefte at ferdigheten blir lagt til som forventet.

</details>

> [!TIP]
> Bruk `console.log()` strategisk for å spore variabler og hendelser i applikasjonen din. Dette kan hjelpe deg med å forstå flyten og finne feil raskere.


### **Oppgave 2: Jest Grunnleggende - Testing av Funksjoner**

**Mål:** Test funksjoner som hjelper med å formatere data for CV-appen.

**Beskrivelse:**  

Tenk deg at du har en funksjon som formaterer telefonnummeret for CV-en. Den skal sørge for at alle telefonnumre har en bestemt format, for eksempel +47-12345678.  

Skriv en Jest-test for å bekrefte at funksjonen riktig formaterer ulike varianter av telefonnumre til ønsket format.  

[Link: Telefonnummer formatering med Jest](https://jestjs.io/docs/getting-started)


<details><summary>Løsning</summary>

**Steg 1: Definer funksjonen som skal testes**

```javascript
// formatPhone.js
const formatPhone = (phone) => {
  // Formatering logikk
}
```


**Forklaring:** 
Denne funksjonen skal ta et telefonnummer som input og returnere det i ønsket format.

**Steg 2: Skriv en Jest-test for funksjonen**

```javascript
// formatPhone.test.js
test('formats phone numbers correctly', () => {
  expect(formatPhone('12345678')).toBe('+47-12345678');
  // ... flere tester
});
```


**Forklaring:** 
Med Jest, kan vi enkelt skrive tester for funksjoner som `formatPhone` for å sikre at de virker som forventet.

</details>

> [!IMPORTANT]
> Testing av funksjoner er avgjørende for å sikre at applikasjonen din fungerer som forventet og for å unngå feil i produksjon.

### **Oppgave 3: Testing av Data Manipulering**

**Mål:** Test funksjoner som legger til eller fjerner ferdigheter fra CV-en.

**Beskrivelse:**  

I CV-appen kan brukere legge til ferdigheter. Tenk deg at du har en funksjon som tar en ferdighet og legger den til en liste.  

Skriv en Jest-test for å sjekke at når en ferdighet legges til, er den faktisk lagt til i listen. Du bør også teste hva som skjer hvis brukeren prøver å legge til en tom ferdighet eller en ferdighet som allerede er på listen.  

[Link: Teste arrays og iterables med Jest](https://jestjs.io/docs/tutorial-async)

<details><summary>Løsning</summary>

**Steg 1: Opprett funksjonen som skal testes**

```javascript
// skills.js
const addSkill = (skills, skill) => {
  if (skill && !skills.includes(skill)) {
    skills.push(skill);
  }
  return skills;
}
```

**Forklaring:** 
Denne funksjonen tar en liste av ferdigheter og en ny ferdighet som input, og legger til den nye ferdigheten i listen hvis den ikke allerede finnes der.

**Steg 2: Skriv en Jest-test for funksjonen**

```javascript
// skills.test.js
test('adds a skill to the list', () => {
  const skills = ['JavaScript'];
  const updatedSkills = addSkill(skills, 'React');
  expect(updatedSkills).toContain('React');
});
```

**Forklaring:** 
Med Jest, kan vi skrive tester for funksjoner som legger til eller fjerner ferdigheter fra en liste for å sikre korrekt funksjonalitet.

</details>

> [!TIP]
> Test både positive og negative tilfeller for å sikre at funksjonen din håndterer alle mulige scenarier.

### **Oppgave 4: Testing av UI-komponenter med Jest**

**Mål:** Bli kjent med hvordan du kan bruke Jest for å teste interaktive aspekter av CV-appen.

**Beskrivelse:**  

Tenk deg at du har en knapp i CV-appen som, når den blir klikket, åpner et vindu eller en modal der brukere kan redigere sin erfaring.  
Skriv en Jest-test som simulerer et klikk på denne knappen og bekrefter at redigeringsvinduet faktisk åpnes.  

[Link: Simuler events med Jest og @testing-library/react](https://testing-library.com/docs/dom-testing-library/api-events/)

<details><summary>Løsning</summary>

**Steg 1: Opprett komponenten som skal testes**

```javascript
// EditButton.js
import React, { useState } from 'react';

const EditButton = () => {
  const [isOpen, setIsOpen] = useState(false);

  const handleClick = () => {
    setIsOpen(true);
  };

  return (
    <div>
      <button onClick={handleClick}>Edit</button>
      {isOpen && <div>Edit Window</div>}
    </div>
  );
};

export default EditButton;
```

**Forklaring:** 
Denne komponenten viser en knapp som, når den blir klikket, åpner et redigeringsvindu.

**Steg 2: Skriv en Jest-test for komponenten**

```javascript
// EditButton.test.js
import { render, fireEvent } from '@testing-library/react';
import EditButton from './EditButton';

test('opens edit window on click', () => {
  const { getByText } = render(<EditButton />);
  fireEvent.click(getByText('Edit'));
  expect(getByText('Edit Window')).toBeInTheDocument();
});
```

**Forklaring:** 
Med kombinasjonen av Jest og `@testing-library/react`, kan vi simulere brukerinteraksjoner og teste UI-komponenter.

</details>

> [!IMPORTANT]
> Testing av UI-komponenter sikrer at brukergrensesnittet ditt fungerer som forventet og gir en god brukeropplevelse.

### **Oppgave 5: Feilsøking av Kode**

**Mål:** Lær å identifisere og rette feil i koden.

**Beskrivelse:**  
I denne oppgaven skal du finne og rette en feil i en gitt kode. Koden nedenfor er ment å legge til et element i en handleliste, men det er en feil som hindrer den fra å fungere som forventet. Finn feilen og rett den.

**Kode som skal feilsøkes:**

```javascript
// shoppingList.js
const addItem = (list, item) => {
  if (item || !list.includes(item)) {
    list.push(item);
  }
  return list;
}
```

<details><summary>Løsning</summary>

**Løsning:** 
Feilen ligger i betingelsen `if (item || !list.includes(item))`. Den skal bruke en logisk OG (`&&`) i stedet for en logisk ELLER (`||`).

**Rettet kode:**

```javascript
// shoppingList.js
const addItem = (list, item) => {
  if (item && !list.includes(item)) {
    list.push(item);
  }
  return list;
}
```

**Forklaring:** 
Ved å bruke `&&` i stedet for `||`, sikrer vi at elementet kun legges til hvis det ikke er tomt og ikke allerede finnes i listen.

</details>

**Jest Tester**

For å sikre at koden fungerer som forventet etter rettingen, kan du bruke følgende Jest tester:

```javascript
// shoppingList.test.js
test('adds a new item to the list', () => {
  const list = ['apple', 'banana'];
  const result = addItem(list, 'orange');
  expect(result).toEqual(['apple', 'banana', 'orange']);
});

test('does not add an existing item to the list', () => {
  const list = ['apple', 'banana'];
  const result = addItem(list, 'banana');
  expect(result).toEqual(['apple', 'banana']);
});

test('does not add an empty item to the list', () => {
  const list = ['apple', 'banana'];
  const result = addItem(list, '');
  expect(result).toEqual(['apple', 'banana']);
});

test('does not add a null item to the list', () => {
  const list = ['apple', 'banana'];
  const result = addItem(list, null);
  expect(result).toEqual(['apple', 'banana']);
});
```



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

#### **Hvordan jobber man vanligvis med snapshot testing?**

Når du kjører testen for første gang, vil Jest opprette en snapshot-fil som inneholder JSON-representasjonen av `EducationHistory`-komponenten. Denne filen lagres i en mappe kalt `__snapshots__`.

Hvis du gjør endringer i `EducationHistory`-komponenten, vil snapshot-testen feile hvis den nye outputen ikke matcher den lagrede snapshoten. Dette gir deg en mulighet til å gjennomgå endringene og bekrefte at de er forventet.

#### **Hvordan feiler testene ved endringer i komponenten?**

La oss si at du endrer `EducationHistory`-komponenten ved å legge til en ny `<div>`:

```javascript
const EducationHistory = () => (
  <div>
    <h1>Education History</h1>
    <div>New content</div>
  </div>
);
```

Når du kjører testen igjen, vil Jest rapportere en feil fordi den nye outputen ikke matcher den lagrede snapshoten.

#### **Hvordan akseptere nye snapshots etter gjennomgang?**

Hvis du har gjennomgått endringene og bekreftet at de er korrekte, kan du oppdatere snapshotene ved å kjøre følgende kommando:

```bash
npm test -- -u
```

Dette vil oppdatere de lagrede snapshotene med den nye outputen fra komponenten.

</details>

> [!TIP]
> Du kan også bruke `npm test -- --watch` for å kjøre testene kontinuerlig mens du utvikler.

#### **Hvorfor er snapshot testing nyttig?**

Snapshot testing er nyttig fordi det lar oss fange utilsiktede endringer i UI-komponenter. Hvis noen endrer `EducationHistory`-komponenten i fremtiden, vil snapshot-testen feile hvis den nye outputen ikke matcher den lagrede snapshoten. Dette gir oss en mulighet til å gjennomgå endringene og bekrefte at de er forventet.

#### **Oppsummering**

Med snapshot testing kan vi sikre at komponentens output ikke endres utilsiktet over tid. Dette er spesielt nyttig i store prosjekter hvor mange utviklere jobber på samme kodebase, da det hjelper med å opprettholde konsistens i UI-komponentene.



## Innføring i `PropTypes` & `TypeScript`

### **Oppgave 1: Intro til PropTypes**

**Mål:** Bli kjent med PropTypes for typechecking før vi dykker dypere inn i TypeScript.

**Beskrivelse:**  
Opprett en React-komponent `Profile` som viser grunnleggende brukerinformasjon. Bruk PropTypes for å sikre at `Profile` tar inn følgende props:
- `name`: en streng
- `age`: et nummer
- `experience`: en array av objekter, hvor hvert objekt har en `title` (streng) og `years` (nummer).

**Link:** [PropTypes documentation](https://reactjs.org/docs/typechecking-with-proptypes.html)

<details><summary>Løsning</summary>

1. **Opprett en ny React-komponent kalt `Profile`:**  
  Begynn med å opprette en ny fil kalt `Profile.jsx` i prosjektets komponentmappe. Dette er hvor vi skal skrive vår React-komponent.

2. **Skriv komponenten:**  
  Innenfor `Profile.jsx`, importer React og PropTypes. Dette er nødvendig for å kunne bruke React og PropTypes i vår komponent.

  ```javascript
  import React from 'react';
  import PropTypes from 'prop-types';
  ```

  Deretter, opprett `Profile`-komponenten. En komponent i React er en funksjon som returnerer JSX, som er en syntaksutvidelse for JavaScript som ligner på HTML.

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

  **Her spesifiserer vi at `name` skal være en streng, `age` skal være et nummer, og `experience` skal være en array av objekter. Hvert objekt i `experience`-arrayen skal ha en `title` som er en streng og `years` som er et nummer. `isRequired` betyr at disse propsene er obligatoriske.**

  Deretter, eksporter `Profile`-komponenten. Dette gjør at vi kan importere og bruke `Profile`-komponenten i andre deler av vår applikasjon.

  ```javascript
  export default Profile;
  ```

4. **Demonstrer bruk av PropTypes i praksis:**  
  For å demonstrere hvordan PropTypes fungerer, kan vi opprette en annen komponent som bruker `Profile` og med vilje utelate en av de nødvendige propsene. Dette vil utløse en advarsel i konsollen.

  ```javascript
  import React from 'react';
  import Profile from './Profile';

  const App = () => {
    const user = {
     name: 'John Doe',
     // age is missing to demonstrate PropTypes warning
     experience: [
      { title: 'Developer', years: 5 },
      { title: 'Designer', years: 3 },
     ],
    };

    return (
     <div>
      <h1>User Profile</h1>
      <Profile name={user.name} experience={user.experience} />
     </div>
    );
  };

  export default App;
  ```

  Når `App`-komponenten rendres, vil det mangle `age`-prop for `Profile`. Åpne konsollen i Chrome (høyreklikk på siden, velg "Inspect", og gå til "Console"-fanen) for å se advarselen generert av PropTypes.

  ```plaintext
  Warning: Failed prop type: The prop `age` is marked as required in `Profile`, but its value is `undefined`.
  ```

  Denne advarselen hjelper utviklere med å identifisere og rette feil tidlig i utviklingsprosessen.

**Forklaring:**

PropTypes gir typekontroll for props som sendes til en React-komponent. Dette bidrar til å fange feil tidligere i utviklingsprosessen. I denne oppgaven, ved å bruke PropTypes, sikrer vi at `Profile`-komponenten mottar riktige typer for `name`, `age` og `experience`. Dette bidrar til å forbedre robustheten og forutsigbarheten av komponenten.

**For `experience`, har vi brukt `arrayOf` kombinert med `shape` for å spesifisere at det er en array av objekter, hvor hvert objekt har bestemte nøkler med bestemte typer.**

</details>

[React PropTypes and type checking](https://reactjs.org/docs/typechecking-with-proptypes.html)  
[PropTypes on GitHub](https://github.com/facebook/prop-types)

### **Oppgave 2: Integrering av TypeScript i et eksisterende React-prosjekt**

**Mål:** Integrer TypeScript i et eksisterende React JS-prosjekt for CV-applikasjonen.

**Beskrivelse:**  
Ta et eksisterende React JS-prosjekt for CV-applikasjonen og integrer TypeScript. Dette innebærer å installere nødvendige avhengigheter, konfigurere tsconfig, og endre noen av de eksisterende React JS-komponentene til TypeScript-komponenter.

**Link:** [Adding TypeScript to an Existing Project](https://www.typescriptlang.org/docs/handbook/migrating-from-javascript.html)

<details><summary>Løsning</summary>

1. **Installer TypeScript og nødvendige avhengigheter:**  
   I terminalen, kjør følgende kommandoer. Dette vil installere TypeScript og typer for Node, React, React DOM, og Jest.

   ```
   npm install --save typescript @types/node @types/react @types/react-dom @types/jest
   ```

2. **Initialiser en TypeScript konfigurasjonsfil:**  
   Kjør følgende kommando. Dette vil opprette en `tsconfig.json` fil i rotkatalogen av prosjektet, som brukes til å konfigurere TypeScript-kompilatoren.

   ```
   npx tsc --init
   ```

3. **Konfigurer tsconfig for React:**  
   Åpne `tsconfig.json` og gjør følgende endringer. Dette konfigurerer TypeScript til å fungere med React og spesifiserer hvilke filer som skal inkluderes og ekskluderes.

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

4. **Endre filendelser fra `.js` til `.tsx` for React-komponenter:**  
   Dette signaliserer til TypeScript kompileren at filene inneholder JSX. JSX er en syntaksutvidelse for JavaScript som ligner på HTML og brukes i React.

5. **Migrer en React-komponent til TypeScript:**  
   Som et eksempel, la oss ta `Profile`-komponenten fra Oppgave 1. Endre filendelsen til `.tsx` og deretter importer `React` som:

   ```typescript
   import React, { FC } from 'react';
   ```

   Deretter, definer prop-typer for `Profile`. I TypeScript bruker vi grensesnitt (interfaces) for å definere typer for props.

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

De siste trinnene demonstrerer en enkel migrasjon av en React-komponent til TypeScript ved å bruke grensesnitt for props og `FC` (Functional Component) fra `React`.

</details>

[Adding TypeScript to an Existing Project](https://www.typescriptlang.org/docs/handbook/migrating-from-javascript.html)  
[TypeScript and React](https://fettblog.eu/typescript-react/)

### **Oppgave 3: Feilsøking i React-komponenter**

**Mål:** Forbedre feilsøkingsferdigheter ved å identifisere og rette feil i React-komponenter.

**Beskrivelse:**  
I denne oppgaven skal du finne og rette feil i en gitt React-komponent. Koden nedenfor er ment å vise en liste over brukere med navn og alder, men den inneholder en feil som forhindrer riktig visning. Din oppgave er å finne og rette feilen.

**Link:** [React Documentation](https://reactjs.org/docs/getting-started.html)

**Kode:**

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

**Initial list of users with errors:**

```javascript
const users = [
  { id: "1", name: 'Alice', age: 25 }, // Incorrect type for id
  { id: "2", name: 'Bob' }, // Missing age prop and incorrect type for id
  { id: "3", name: 'Charlie', age: 'thirty' } // Incorrect type for age and id
];
```

<details><summary>Løsning</summary>

Feilene i koden er:
1. `id`-propen er definert som et nummer, men sendes inn som en streng.
2. Brukeren Bob mangler `age`-prop.
3. Brukeren Charlie har `age`-prop med feil type (streng i stedet for nummer).

For å rette feilene, må vi oppdatere `users`-arrayen slik at alle brukere har riktige props og typer.

```javascript
const users = [
  { id: 1, name: 'Alice', age: 25 }, // Corrected type for id
  { id: 2, name: 'Bob', age: 30 }, // Added missing age prop and corrected type for id
  { id: 3, name: 'Charlie', age: 30 } // Corrected type for age and id
];
```

Ved å rette typen for `id`, legge til den manglende `age`-propen for Bob, og rette typen for Charlie, sikrer vi at `UserList`-komponenten mottar riktige props og typer, og typekontrollen vil fungere som forventet.

</details>






### **Oppgave 4: Feilsøking i TypeScript**

**Mål:** Lære å identifisere og rette opp feil i TypeScript-kode.

**Beskrivelse:**  
I denne oppgaven skal du feilsøke en `Profile`-komponent som er skrevet i TypeScript. Koden har en feil som forhindrer den fra å fungere som forventet. Din oppgave er å finne og rette opp feilen. Koden skal vise brukerens navn, alder og arbeidserfaring.

**Link:** [TypeScript Error Handling](https://www.typescriptlang.org/docs/handbook/basic-types.html)

> [!NOTE]  
> Hvis du ønsker å teste dette loktalt, er det viktig at filen har endingen `.tsx`, og ikke `.jsx`.

Her er koden for `Profile`-komponenten:

  ```typescript
  import React, { FC } from 'react';

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
        <h1>{name}</h1>
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

  // Usage example with incorrect props
  const App = () => {
    return (
      <Profile
        name="John Doe"
        age="30" // Error: age should be a number
        experience={[
          { title: "Developer", years: "5" }, // Error: years should be a number
          { title: "Manager", years: 3 }
        ]}
      />
    );
  };

  export default App;
  ```
  
  <details><summary>Løsning</summary>

  Feilen i koden er at `age`- og `years`-propene ikke blir sendt inn i riktig format. Her er den korrigerte koden:

  ```typescript
  import React, { FC } from 'react';

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
        <h1>{name}</h1>
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

  // Usage example with correct props
  const App = () => {
    return (
      <Profile
        name="John Doe"
        age={30} // Corrected: age is now a number
        experience={[
          { title: "Developer", years: 5 }, // Corrected: years is now a number
          { title: "Manager", years: 3 }
        ]}
      />
    );
  };

  export default App;
  ```

  **Forklaring:**  
  Etter å ha rettet opp feilen, vil `Profile`-komponenten nå vise brukerens navn, alder og arbeidserfaring korrekt. Sørg for at dataene som sendes inn som props samsvarer med `ProfileProps`-grensesnittet.

  </details>



### **Oppgave 5: Bruk av Type Assertions**
**Mål:** Forstå hvordan og når du skal bruke type assertions i TypeScript.

**Beskrivelse:**  
I CV-applikasjonen, opprett en hjelpefunksjon `parseUserData` som tar en streng (JSON format) og konverterer den til et objekt. Bruk type assertions for å forsikre TypeScript at den returnerte verdien er av en spesifikk type (f.eks. `UserProfile` type).

Bruk for eksempel følgende grensesnitt og JSON streng:

```typescript
interface UserProfile {
       name: string;
       age: number;
       experience: { title: string; years: number }[];
    }
```

`'{"name":"John Doe","age":30,"experience":[{"title":"Developer","years":5},{"title":"Manager","years":3}]}'`

**Link:** [TypeScript Type Assertions](https://www.typescriptlang.org/docs/handbook/basic-types.html#type-assertions)

<details><summary>Løsning</summary>

1. **Opprett en ny fil:**  
    Lag en ny fil kalt `UserProfile.ts`.

2. **Definer et grensesnitt for brukerprofildata:**  

    ```typescript
    interface UserProfile {
       name: string;
       age: number;
       experience: { title: string; years: number }[];
    }
    ```

3. **Opprett funksjonen `parseUserData`:**  

    ```typescript
    const parseUserData = (jsonData: string): UserProfile => JSON.parse(jsonData) as UserProfile;

    const jsonData = `'{"name":"John Doe","age":30,"experience":[{"title":"Developer","years":5},{"title":"Manager","years":3}]}'`;

    const parsedUserData: UserProfile = parseUserData(jsonData);
    ```

**Forklaring:**

Funksjonen `parseUserData` konverterer en JSON-streng til et objekt. Ved bruk av type assertions (i dette tilfellet `as UserProfile`), forsikrer vi TypeScript om at det returnerte objektet matcher grensesnittet `UserProfile`.

Dette er nyttig når vi vet hvilken form dataen vil ha, selv om TypeScript ikke automatisk kan dedusere det. Type assertions tillater oss å spesifikt 'fortelle' TypeScript hvilken type en verdi er, forutsatt at vi vet mer enn TypeScript om den aktuelle verdien.

Merk: Mens type assertions kan være kraftige, bør de brukes varsomt. Å forsikre TypeScript feilaktig om en types form kan føre til uventede feil som er vanskelige å feilsøke.

</details>

[TypeScript Type Assertions](https://www.typescriptlang.org/docs/handbook/basic-types.html#type-assertions)  
[Assert function argument is a certain type in TypeScript](https://stackoverflow.com/questions/40081332/assert-function-argument-is-a-certain-type-in-typescript)

### **Oppgave 6: Union Typer og Literal Typer**

**Mål:** Utforske hvordan union typer og literal typer kan være nyttige i CV-applikasjonen.

**Beskrivelse:**  
Lag en komponent `Filter` i CV-applikasjonen som lar brukere filtrere jobberfaring basert på jobbtittel eller årstall. Denne komponenten skal ha en prop som bestemmer hvilken type filter den skal bruke. Bruk union typer for å definere denne propen som enten en streng (jobbtittel) eller et nummer (årstall). Bruk også literal typer for å sikre at den aksepterte strengen er en av forhåndsdefinerte jobbtitler.

**Link:** [TypeScript Union and Literal Types](https://www.typescriptlang.org/docs/handbook/unions-and-intersections.html)

<details><summary>Løsning</summary>

1. **Opprett en ny fil:**  
   Lag en ny fil kalt `Filter.tsx`.

2. **Definer typer for filtrering:**  

   ```typescript
   type JobTitle = 'Developer' | 'Designer' | 'Manager';
   type FilterType = JobTitle | number;
   ```

3. **Opprett Filter-komponenten:**  

   ```typescript
   interface FilterProps {
     filterBy: FilterType;
     experiences: { jobTitle: JobTitle; year: number }[];
   }

   const Filter: React.FC<FilterProps> = ({ filterBy, experiences }) => {
     const filteredExperiences = experiences.filter(experience => {
       if (typeof filterBy === 'string') {
         return experience.jobTitle === filterBy;
       } else if (typeof filterBy === 'number') {
         return experience.year === filterBy;
       }
       return false;
     });

     return (
       <div>
         {filteredExperiences.map((experience, index) => (
           <div key={index}>
             <p>Job Title: {experience.jobTitle}</p>
             <p>Year: {experience.year}</p>
           </div>
         ))}
       </div>
     );
   };
   ```

4. **Eksempel på bruk:**  

   ```typescript
   const jobExperiences = [
     { jobTitle: 'Developer', year: 2020 },
     { jobTitle: 'Designer', year: 2019 },
     { jobTitle: 'Manager', year: 2021 },
   ];

   // Filtrer etter jobbtittel
   <Filter filterBy="Developer" experiences={jobExperiences} />

   // Filtrer etter årstall
   <Filter filterBy={2019} experiences={jobExperiences} />
   ```

**Forklaring:**

Vi starter med å definere `JobTitle` som en literal type. Dette betyr at den kan være en av tre strenger: 'Developer', 'Designer', eller 'Manager'. Vi definerer deretter `FilterType` som en union type, noe som betyr at den kan være enten en `JobTitle` eller et `number`.

I `Filter`-komponenten bruker vi type-sjekker (`typeof filterBy === 'string'`) for å avgjøre hvordan vi skal filtrere, basert på om `filterBy` er en streng eller et nummer. Denne tilnærmingen utnytter kraften av TypeScript for å sørge for at koden vår er type-sikker og gir forventet oppførsel basert på hvilken type data som sendes til komponenten.

Union og literal typer i TypeScript gir fleksibilitet i definisjonen av variable typer, samtidig som de gir sterk typesikkerhet.

</details>

[TypeScript Union and Literal Types](https://www.typescriptlang.org/docs/handbook/unions-and-intersections.html)  
[Practical TypeScript: Union and Intersection Types](https://dzone.com/articles/practical-typescript-union-and-intersection-types)

### **Oppgave 7: Generiske Typer**

**Mål:** Utforske dypere bruken av generiske typer i TypeScript.

**Beskrivelse:**  
Lag en generisk funksjon `getDetails` som tar en array av objekter og en nøkkel som en streng. Denne funksjonen skal returnere en ny array med verdiene tilhørende den nøkkelen fra hvert objekt. For eksempel, hvis den mottar en array av jobberfaringer og nøkkelen 'jobTitle', skal den returnere en array av jobbtitlene.

**Link:** [TypeScript Handbook: Generics](https://www.typescriptlang.org/docs/handbook/generics.html)

<details><summary>Løsning</summary>

1. **Opprett en ny fil:**  
   Lag en ny fil kalt `Utilities.ts`.

2. **Definer en generisk funksjon:**  

   ```typescript
   const getDetails = <T, K extends keyof T>(items: T[], key: K): T[K][] => items.map(item => item[key]);
   ```

3. **Eksempel på bruk:**  

   ```typescript
   const jobExperiences = [
     { jobTitle: 'Developer', year: 2020 },
     { jobTitle: 'Designer', year: 2019 },
   ];

   const jobTitles = getDetails(jobExperiences, 'jobTitle'); // ['Developer', 'Designer']
   ```

**Forklaring:**

I denne oppgaven har vi laget en generisk funksjon ved navn `getDetails` som returnerer detaljer fra en gitt nøkkel for hvert objekt i en array. 

Den første generiske typen, `T`, representerer en hvilken som helst type. Den andre generiske typen, `K`, er begrenset til å være en nøkkel av `T` ved hjelp av `extends keyof T`.

Ved å kalle `getDetails` med `jobExperiences`-arrayen og nøkkelen 'jobTitle', får vi en ny array som inneholder kun jobbtitlene fra `jobExperiences`.

Generiske typer tillater deg å lage fleksible funksjoner og komponenter som kan håndtere mange forskjellige datatyper samtidig som de gir type-sikkerhet.

</details>

[TypeScript Handbook: Generics](https://www.typescriptlang.org/docs/handbook/generics.html)  
[Understanding TypeScript Generics](https://www.tutorialsteacher.com/typescript/typescript-generics)


