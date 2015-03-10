module Data.Functor.Invariant where

-- | A type of functor that can be used to adapt the type of a wrapped function
-- | where the parameterised type occurs in both the positive and negative
-- | position, for example, `F (a -> a)`.
-- |
-- | An `Invariant` instance should satisfy the following laws:
-- |
-- | - Identity: `invmap id id = id`
-- | - Composition: `invmap g1 g2 <<< invmap f1 f2 = invmap (g1 <<< f1) (f2 <<< g2)`
-- |
class Invariant f where
  invmap :: forall a b. (a -> b) -> (b -> a) -> f a -> f b

-- | All `Functor`s are also trivially `Invariant`.
instance invariantFromFunctor :: (Functor f) => Invariant f where
  invmap = const <<< (<$>)
