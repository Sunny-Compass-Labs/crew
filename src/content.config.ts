import { defineCollection, z } from 'astro:content';

const products = defineCollection({
  type: 'content',
  schema: z.object({
    name: z.string(),
    tagline: z.string(),
    description: z.string(),
    status: z.enum(['coming-soon', 'available', 'discontinued']),
    image: z.string().optional(),
    price: z.number().optional(),
    launchDate: z.date().optional(),
    features: z.array(z.string()).optional(),
    order: z.number().default(0),
  }),
});

export const collections = { products };
