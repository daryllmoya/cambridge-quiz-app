<template>
  <div>
    <Header />
    <slot />
    <Footer />
  </div>
</template>

<script lang="ts">
import Header from '@/components/Header.vue';
import Footer from '@/components/Footer.vue';

export default defineComponent({
  components: {
    Header,
    Footer
  },
});
</script>