<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Country
 *
 * @ORM\Table(name="country")
 * @ORM\Entity
 */
class Country
{
    /**
     * @var int
     *
     * @ORM\Column(name="countryId", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $countryid;

    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=255, nullable=false)
     */
    private $name;

    /**
     * @var string|null
     *
     * @ORM\Column(name="flagUrl", type="string", length=255, nullable=true, options={"default"="NULL"})
     */
    private $flagurl = 'NULL';

    public function getCountryid(): ?int
    {
        return $this->countryid;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getFlagurl(): ?string
    {
        return $this->flagurl;
    }

    public function setFlagurl(?string $flagurl): self
    {
        $this->flagurl = $flagurl;

        return $this;
    }


}
