import { useEffect, useState } from 'react';

const SimpleForm = () => {
  const [formData, setFormData] = useState({ name: '', email: '' });

  useEffect(() => {
    console.log('Skjema data:', formData);
  }, [formData]);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData({ ...formData, [name]: value });
  };

  return (
    <form>
      <div>
        <label>Navn:</label>
        <input type="text" name="name" value={formData.name} onChange={handleChange} />
      </div>
      <div>
        <label>Email:</label>
        <input type="email" name="email" value={formData.email} onChange={handleChange} />
      </div>
    </form>
  );
}